from sagemaker.predictor import Predictor
from sagemaker.serializers import CSVSerializer
from sagemaker.deserializers import JSONDeserializer
endpoint_name = "static-endpoint-name"

# Create a Predictor object
predictor = Predictor(
    endpoint_name=endpoint_name,
    serializer=CSVSerializer(),  # Ensures input is formatted as CSV
    deserializer=JSONDeserializer(),  # Parses JSON output
)

for _ in range(1000):
    # Sample input data (excluding the target column)
    sample_data = [[30, 1, 12345]]  # Must be a 2D list

    # Invoke the endpoint
    prediction = predictor.predict(sample_data)

    print("Prediction response:", prediction)

