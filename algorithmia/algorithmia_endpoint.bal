public type Client object {
    
    public AlgorithmiaConnector algorithmiaConnector;

    public function init(AlgorithmiaConfiguration config) {
        self.algorithmiaConnector = new;
        self.algorithmiaConnector.init(config);
    }

    public function getCallerActions() returns AlgorithmiaConnector {
        return self.algorithmiaConnector;
    }

};

public type AlgorithmiaConfiguration record {
    string apiKey;
};

public type AlgoResponse record {
    json result;
    json metadata;
};

