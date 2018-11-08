import ballerina/http;

public type AlgorithmiaConnector object {

    public http:Client client;

    public AlgorithmiaConfiguration config;

    public function init(AlgorithmiaConfiguration pconfig) { 
        self.config = pconfig;
        http:ClientEndpointConfig hc = { url: ALGORITHMIA_BASE_URL };
        self.client.init(hc);
    }

    public function pipe(string algorithm, string input) returns AlgoResponse|error;

};

function AlgorithmiaConnector::pipe(string algorithm, string input) returns AlgoResponse|error {
    endpoint http:Client httpClient = self.client;
    http:Request request = new;
    json payload = input;
    request.setHeader("Authorization", "Simple " + self.config.apiKey);
    request.setJsonPayload(untaint payload);
    var response = httpClient->post("/" + algorithm, request);
    match response {
        http:Response httpResponse => {
            json result = check httpResponse.getJsonPayload();
            AlgoResponse algoResp = { result: result.result, metadata: result.metadata };
            return algoResp;
        }
        error err => {
            return err;
        }
    }
}
