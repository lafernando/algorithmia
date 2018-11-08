Connects to Algorithmia APIs from Ballerina. 

## Sample

```ballerina
import ballerina/io;
import laf/algorithmia;

endpoint algorithmia:Client client {
   apiKey: "<API_KEY>"
};

public function main(string... args) {
    algorithmia:AlgoResponse resp = check client->pipe("LgoBE/CarMakeandModelRecognition/0.3.15", "https://www.cars.com/cstatic-images/car-pictures/maxWidth503/usc70toc041g021001.png");
    io:println(resp.result);
    io:println(resp.metadata);

    resp = check client->pipe("zskurultay/ImageSimilarity/0.1.4", ["https://www.cars.com/cstatic-images/car-pictures/maxWidth503/usc70toc041g021001.png", "https://www.cars.com/cstatic-images/car-pictures/maxWidth503/usc70toc041g021001.png"]);
    io:println(resp.result);
    io:println(resp.metadata);
}
```
