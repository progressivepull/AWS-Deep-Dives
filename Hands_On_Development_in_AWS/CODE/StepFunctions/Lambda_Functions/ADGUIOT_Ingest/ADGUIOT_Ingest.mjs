import { SFNClient, SendTaskSuccessCommand } from "@aws-sdk/client-sfn";
import { DynamoDBClient, GetItemCommand, UpdateItemCommand } from "@aws-sdk/client-dynamodb";

const DDBTableName = "ADGUIOT";

const sfClient = new SFNClient({});
const ddbClient = new DynamoDBClient({});

async function updateShadow(data) {
  var now = new Date().toISOString()
  const command = new UpdateItemCommand({
    TableName: DDBTableName,
    Key: {
      pk: { S: "shadow" },
      sk: { S: data.uuid }
    },
    UpdateExpression: "SET tc = :tc, rh = :rh, updatedAt = :updatedAt, isVio = :isVio",
    ExpressionAttributeValues: {
      ":tc": { "N": ""+data.tc },
      ":rh": { "N": ""+data.rh },
      ":updatedAt": { "S": now },
      ":isVio": { "BOOL": data.isVio }
    },
    ReturnValues: "ALL_NEW"
  });
  
  console.log("updateShadow: input to ddbClient.send: " + JSON.stringify(command));
  
  const response = await ddbClient.send(command);
  
  console.log("updateShadow response: " + JSON.stringify(response));
  
  return response;
}

async function getThresholds(uuid) {
  var input = {
      TableName: DDBTableName, 
      Key: {
        pk: { S: "thresholds" },
        sk: { S: uuid }
      }
  };
  console.log("getThresholds DDB input: " + JSON.stringify(input));
  const command = new GetItemCommand(input);
  const response = await ddbClient.send(command);
  console.log("getThresholds DDB query results: " + JSON.stringify(response));
  return response;
}

export const handler = async(event, context) => {
    var ret = {uuid: event.input.uuid, isVio: false, error: "", vioMsg: "", isError: false};
    
    /* 
     * Add isVio to the input so the updateShadow function can set it from the
     * result of checkForViolations
     */
     event.input.isVio = false;
    
    console.log("Context: " + JSON.stringify(context));
    console.log("Event: " + JSON.stringify(event));
    
    /*
     * Get thresholds from DDB
     */
    var thresholds = await getThresholds(event.input.uuid);
    console.log("RX thresholds: " + JSON.stringify(thresholds));
    
    console.log("thresholds: " + JSON.stringify(thresholds));
    /*
     * check for violations
     */

    if (!(thresholds.Item == undefined)) {
      var tcHigh = parseInt(thresholds.Item.tcHigh.N);
      var tcLow = parseInt(thresholds.Item.tcLow.N);
      var rhHigh = parseInt(thresholds.Item.rhHigh.N);
      var rhLow = parseInt(thresholds.Item.rhLow.N);
      
      if (event.input.tc < tcLow) {
        ret.isVio = true;
        event.input.isVio = true;
        ret.vioMsg += "Temperature is below threshold, " + event.input.tc + " < " + tcLow + ". ";
      } else  if (event.input.tc > tcHigh) {
        ret.isVio = true;
        event.input.isVio = true;
        ret.vioMsg += "Temperature is above threshold, " + event.input.tc + " > " + tcHigh + ". ";
      }
      
      if (event.input.rh < rhLow) {
        ret.isVio = true;
        event.input.isVio = true;
        ret.vioMsg += "Humidity is below threshold, " + event.input.rh + " < " + rhLow + ". ";
      } else  if (event.input.rh > rhHigh) {
        ret.isVio = true;
        event.input.isVio = true;
        ret.vioMsg += "Humidity is above threshold, " + event.input.rh + " > " + rhHigh + ". ";
      }
      
    } else {
      ret.error = "Thresholds not found!";
    }
    
    /*
     * Update Shadow
     */
     var updateShadowResults = await updateShadow(event.input);
    
    /*
     * Input to SendTaskSuccess
     * Output is the output from the function execution
     */
    if (ret.error.length > 0) { 
      ret.isError = true;
    }
    
    const input = { 
      taskToken: event.taskToken,
      output: JSON.stringify({Payload: ret}) 
    };
    
    console.log("Returning: " + JSON.stringify(input));
    
    const command = new SendTaskSuccessCommand(input);
    const response = await sfClient.send(command);
    
};
