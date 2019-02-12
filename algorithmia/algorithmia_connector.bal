import ballerina/http;

# This represents the Algorithmia Client connector.
public type Client client object {

    http:Client httpClient;

    Configuration config;

    public function __init(Configuration pconfig) { 
        self.config = pconfig;
        self.httpClient = new(ALGORITHMIA_BASE_URL);
    }

    # Executes the algorithm on the given input.
    # 
    # + algorithm - The algorithm to use
    # + input - The input to be used with the algorithm
    # + return - The algorithm response, or an `error` in a failure
    public remote function pipe(string algorithm, json input) returns AlgoResponse|error;

};

public remote function Client.pipe(string algorithm, json input) returns AlgoResponse|error {
    http:Client httpClient = self.httpClient;
    http:Request request = new;
    request.setHeader("Authorization", "Simple " + self.config.apiKey);
    request.setJsonPayload(untaint input);
    var response = check httpClient->post("/" + algorithm, request);
    json result = check response.getJsonPayload();
    if (result["error"] != ()) {
        error err = error("Error", { message: <string> result["error"].message });
        return err;
    } else {
        AlgoResponse algoResp = { result: result.result, metadata: result.metadata };
        return algoResp;
    }
}

public type Configuration record {
    string apiKey;
};

public type AlgoResponse record {
    json result;
    json metadata;
};

