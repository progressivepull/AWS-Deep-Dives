import { API } from '@aws-amplify/api'
import config from './aws-exports.js'
import { listAppSyncCars } from './graphql/queries.js'
import { createAppSyncCar } from './graphql/mutations.js'

// Configure using the amplify generated exports
API.configure(config)

// List cars
async function list() {
   const response = await API.graphql({
      query: listAppSyncCars,
      variables: {},
   })
  console.log("List response:\n" + JSON.stringify(response.data.listAppSyncCars.items, null, 2));
}

// Create Car 
async function createCar(carInfo) {
  try {
    const response = await API.graphql({
      query: createAppSyncCar,
      variables: {
        input: {
          id: Math.floor(Math.random() * 100000),
          make: carInfo.make,
          model: carInfo.model,
          year: carInfo.year
        }
      }
    });
    console.log("Create response:\n" + JSON.stringify(response));
  } catch (error) {
    console.log(error);
  }
}

// list current cars
console.log(">>>>>   List cars");
await list();
console.log("");

// create car one
var carOne = {"make":"Honda", "model":"Odyssey", "year":2000};
console.log(">>>>>   Create car one: " + JSON.stringify(carOne));
await createCar(carOne);
console.log("");

// create car two
var carTwo = {"make":"Toyota", "model":"Camry", "year":2010};
console.log(">>>>>   Create car two: " + JSON.stringify(carTwo));
await createCar(carTwo);
console.log("");

// list current cars
console.log(">>>>>   List cars");
await list();
console.log("");

