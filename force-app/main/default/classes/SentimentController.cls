public with sharing class SentimentController {

    @AuraEnabled
    public static void createSentimentRecord(String positiveValue, String neutralValue, String negativeValue, String sentimentResult, String text, String contactId) {

        Sentiment_Analysis__c sentAnalysis = new Sentiment_Analysis__c(
            Analysed_Text__c = text,
            Positive_Score__c = Decimal.ValueOf(positiveValue),
            Neutral_Score__c = Decimal.ValueOf(neutralValue),
            Negative_Score__c = Decimal.ValueOf(negativeValue),
            Contact__c = contactId
        );
        if(sentimentResult == 'POSITIVE'){
            sentAnalysis.Result__c = 'Positive';
        }else if(sentimentResult == 'NEUTRAL'){
            sentAnalysis.Result__c = 'Neutral';
        }else if(sentimentResult == 'NEGATIVE'){
            sentAnalysis.Result__c = 'Negative';
        }else{
            sentAnalysis.Result__c = 'Unknown';
        }
        Contact con = [SELECT Id, Number_of_Negative_Calls__c, Number_of_Positive_Calls__c 
                            FROM Contact 
                            WHERE Id = :contactId];
        
        try{
            if(sentAnalysis.Result__c == 'Positive'){
                con.Number_of_Positive_Calls__c += 1;
            }else if(sentAnalysis.Result__c == 'Negative'){
                con.Number_of_Negative_Calls__c += 1;
            }

            update con;
            insert sentAnalysis;

        }catch(Exception e){
            System.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }
}
