public with sharing class SentimentCallOut {
public class SentimentCallOutException extends Exception {}

    @AuraEnabled
    public static Map<String,Object> submitForSentimentCheck(String text) {

        List<TheySay_Settings__mdt> theysayMetaDataList = new List<TheySay_Settings__mdt>();
        TheySay_Settings__mdt liveRecord = new TheySay_Settings__mdt();
        
        if((theysayMetaDataList = [SELECT Id, MasterLabel, Endpoint_Sentiment_Check__c, Active__c, Live_settings__c
                                FROM TheySay_Settings__mdt
                                WHERE Active__c = true
                                AND Live_settings__c = true]).size() == 1){

            System.debug('Metadata query returned > ' + theysayMetaDataList);

            liveRecord = theysayMetaDataList[0];

        }else{
            System.debug('Metadata query returned > ' + theysayMetaDataList);
            throw new SentimentCallOutException('Either 0 or more than 1 \'Live Org\' custom metadata setting was returned. Ensure you only have 1 active.');
        }

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setHeader('content-length', + String.valueOf(text.length()));
        request.setEndpoint(liveRecord.Endpoint_Sentiment_Check__c);
        request.setMethod('POST');
        
        
        JSONGenerator jsonGen = JSON.createGenerator(true);
        jsonGen.writeStartObject();
        jsonGen.writeStringField('text', text);
        jsonGen.writeStringField('level', 'sentence');
        jsonGen.writeEndObject();
        request.setBody(jsonGen.getAsString());
        
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200 || response.getStatusCode() == 201) {
			Map<String,Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> sentimenMap = (Map<String,Object>)responseMap.get('sentiment');

            return sentimenMap;
            
        }else{
            Map<String,Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> sentiment = (Map<String,Object>)responseMap.get('sentiment');
			throw new SentimentCallOutException('A ' + response.getStatusCode() + ' error occurred. ');
        }
    }
}
