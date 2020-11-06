@isTest(seeAllData=false)
public with sharing class SentimentCallOutTest {
     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Map<String,Object> res = SentimentCallOut.submitForSentimentCheck('Random text for callout and sentiment check via test method. Jonathan Fox');
        
        // Verify response received contains fake values
        System.assertEquals(res.get('label'), 'POSITIVE');
        System.assertEquals(res.get('positive'), 0.941);
        System.assertEquals(res.get('negative'), 0.0);
        System.assertEquals(res.get('neutral'), 0.059);
    }
}

