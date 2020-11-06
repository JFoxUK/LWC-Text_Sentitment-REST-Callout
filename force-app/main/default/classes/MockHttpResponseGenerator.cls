@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://private-anon-a72e13f281-theysay.apiary-mock.com/v1/sentiment', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());

        String text = req.getBody();
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"sentiment": {"label": "POSITIVE","positive": 0.941,"negative": 0.0,"neutral": 0.059},"wordCount": 12}}');
        res.setStatusCode(200);
        return res;
    }
}