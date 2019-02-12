Connects to Algorithmia APIs from Ballerina. 

## Sample

```ballerina
import ballerina/io;
import laf/algorithmia;

algorithmia:Configuration config = {
   apiKey: "<API_KEY>"
};

algorithmia:Client clientEP = new(config);

public function main(string... args) {
    var resp = clientEP->pipe("LgoBE/CarMakeandModelRecognition/0.3.15", "https://www.cars.com/cstatic-images/car-pictures/maxWidth503/usc70toc041g021001.png");
    if (resp is algorithmia:AlgoResponse) {
        io:println(resp.result);
        io:println(resp.metadata);
    } else {
        io:println(resp);
    }
    resp = clientEP->pipe("zskurultay/ImageSimilarity/0.1.4", ["https://www.cars.com/cstatic-images/car-pictures/maxWidth503/usc70toc041g021001.png", "https://www.cars.com/cstatic-images/car-pictures/maxWidth503/usc70toc041g021001.png"]);
    if (resp is algorithmia:AlgoResponse) {
        io:println(resp.result);
        io:println(resp.metadata);
    } else {
        io:println(resp);
    }
}
```
