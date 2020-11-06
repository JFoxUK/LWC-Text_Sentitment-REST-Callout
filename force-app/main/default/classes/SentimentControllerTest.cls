@isTest(seeAllData=False)
public with sharing class SentimentControllerTest {

    @testSetup static void setup() {
        Contact testCon = new Contact(FirstName = 'Test', 
                                        LastName = 'Con SentimentControllerTest'
                                    );
        insert testCon;     
    }

    @isTest
    public static void sentimentCreationPositive() {
        String todayDate = String.valueOf(system.today().format());
        String positiveVal = '0.1';
        String neutralVal = '0.2';
        String negativeVal = '0.3';
        Decimal decimalpositiveVal = Decimal.valueof('0.1');
        Decimal decimalneutralVal = Decimal.valueof('0.2');
        Decimal decimalnegativeVal = Decimal.valueof('0.3');
        String sentimentResultPos = 'POSITIVE';
        String text = 'Test class method text for analysis.' + todayDate;
        String contactId = [SELECT Id FROM Contact WHERE FirstName = 'Test' AND LastName = 'Con SentimentControllerTest'].Id;

        SentimentController.createSentimentRecord(positiveVal, neutralVal, negativeVal, sentimentResultPos, text, contactId);

        Sentiment_Analysis__c createdPosSentAna = [SELECT ID, 
                                                            Analysed_Text__c, 
                                                            Positive_Score__c, 
                                                            Neutral_Score__c, 
                                                            Negative_Score__c, 
                                                            Contact__c,
                                                            Result__c 
                                                    FROM Sentiment_Analysis__c 
                                                    WHERE Contact__c = :contactId
                                                    ];
        System.assertEquals(0.1, createdPosSentAna.Positive_Score__c);
        System.assertEquals(0.2, createdPosSentAna.Neutral_Score__c);
        System.assertEquals(0.3, createdPosSentAna.Negative_Score__c);
        System.assertEquals(contactId, createdPosSentAna.Contact__c);
        System.assertEquals('Test class method text for analysis.' + todayDate, createdPosSentAna.Analysed_Text__c);
        System.assertEquals('Positive', createdPosSentAna.Result__c);
    }
    
    @isTest
    public static void sentimentCreationNeutral() {
        String todayDate = String.valueOf(system.today().format());
        String positiveVal = '0.1';
        String neutralVal = '0.2';
        String negativeVal = '0.3';
        Decimal decimalpositiveVal = Decimal.valueof('0.1');
        Decimal decimalneutralVal = Decimal.valueof('0.2');
        Decimal decimalnegativeVal = Decimal.valueof('0.3');
        String sentimentResultNeu = 'NEUTRAL';
        String text = 'Test class method text for analysis.' + todayDate;
        String contactId = [SELECT Id FROM Contact WHERE FirstName = 'Test' AND LastName = 'Con SentimentControllerTest'].Id;

        SentimentController.createSentimentRecord(positiveVal, neutralVal, negativeVal, sentimentResultNeu, text, contactId);

        Sentiment_Analysis__c createdPosSentAna = [SELECT ID, 
                                                            Analysed_Text__c, 
                                                            Positive_Score__c, 
                                                            Neutral_Score__c, 
                                                            Negative_Score__c, 
                                                            Contact__c,
                                                            Result__c 
                                                    FROM Sentiment_Analysis__c 
                                                    WHERE Contact__c = :contactId
                                                    ];
        System.assertEquals(0.1, createdPosSentAna.Positive_Score__c);
        System.assertEquals(0.2, createdPosSentAna.Neutral_Score__c);
        System.assertEquals(0.3, createdPosSentAna.Negative_Score__c);
        System.assertEquals(contactId, createdPosSentAna.Contact__c);
        System.assertEquals('Test class method text for analysis.' + todayDate, createdPosSentAna.Analysed_Text__c);
        System.assertEquals('Neutral', createdPosSentAna.Result__c);
    }

    @isTest
    public static void sentimentCreationNegative() {
        String todayDate = String.valueOf(system.today().format());
        String positiveVal = '0.1';
        String neutralVal = '0.2';
        String negativeVal = '0.3';
        Decimal decimalpositiveVal = Decimal.valueof('0.1');
        Decimal decimalneutralVal = Decimal.valueof('0.2');
        Decimal decimalnegativeVal = Decimal.valueof('0.3');
        String sentimentResultNeg = 'NEGATIVE';
        String text = 'Test class method text for analysis.' + todayDate;
        String contactId = [SELECT Id FROM Contact WHERE FirstName = 'Test' AND LastName = 'Con SentimentControllerTest'].Id;

        SentimentController.createSentimentRecord(positiveVal, neutralVal, negativeVal, sentimentResultNeg, text, contactId);

        Sentiment_Analysis__c createdPosSentAna = [SELECT ID, 
                                                            Analysed_Text__c, 
                                                            Positive_Score__c, 
                                                            Neutral_Score__c, 
                                                            Negative_Score__c, 
                                                            Contact__c,
                                                            Result__c 
                                                    FROM Sentiment_Analysis__c 
                                                    WHERE Contact__c = :contactId
                                                    ];
        System.assertEquals(0.1, createdPosSentAna.Positive_Score__c);
        System.assertEquals(0.2, createdPosSentAna.Neutral_Score__c);
        System.assertEquals(0.3, createdPosSentAna.Negative_Score__c);
        System.assertEquals(contactId, createdPosSentAna.Contact__c);
        System.assertEquals('Test class method text for analysis.' + todayDate, createdPosSentAna.Analysed_Text__c);
        System.assertEquals('Negative', createdPosSentAna.Result__c);
    }

    @isTest
    public static void sentimentCreationNK() {
        String todayDate = String.valueOf(system.today().format());
        String positiveVal = '0.1';
        String neutralVal = '0.2';
        String negativeVal = '0.3';
        Decimal decimalpositiveVal = Decimal.valueof('0.1');
        Decimal decimalneutralVal = Decimal.valueof('0.2');
        Decimal decimalnegativeVal = Decimal.valueof('0.3');
        String sentimentResultNK = 'UnknowRandomString';
        String text = 'Test class method text for analysis.' + todayDate;
        String contactId = [SELECT Id FROM Contact WHERE FirstName = 'Test' AND LastName = 'Con SentimentControllerTest'].Id;

        SentimentController.createSentimentRecord(positiveVal, neutralVal, negativeVal, sentimentResultNK, text, contactId);

        Sentiment_Analysis__c createdPosSentAna = [SELECT ID, 
                                                            Analysed_Text__c, 
                                                            Positive_Score__c, 
                                                            Neutral_Score__c, 
                                                            Negative_Score__c, 
                                                            Contact__c,
                                                            Result__c 
                                                    FROM Sentiment_Analysis__c 
                                                    WHERE Contact__c = :contactId
                                                    ];
        System.assertEquals(0.1, createdPosSentAna.Positive_Score__c);
        System.assertEquals(0.2, createdPosSentAna.Neutral_Score__c);
        System.assertEquals(0.3, createdPosSentAna.Negative_Score__c);
        System.assertEquals(contactId, createdPosSentAna.Contact__c);
        System.assertEquals('Test class method text for analysis.' + todayDate, createdPosSentAna.Analysed_Text__c);
        System.assertEquals('Unknown', createdPosSentAna.Result__c);
    }

    @isTest
    public static void contactUpdatePosAddition() {
        String todayDate = String.valueOf(system.today().format());
        String positiveVal = '0.1';
        String neutralVal = '0.2';
        String negativeVal = '0.3';
        Decimal decimalpositiveVal = Decimal.valueof('0.1');
        Decimal decimalneutralVal = Decimal.valueof('0.2');
        Decimal decimalnegativeVal = Decimal.valueof('0.3');
        String sentimentResultPos = 'POSITIVE';
        String text = 'Test class method text for analysis.' + todayDate;
        String contactId = [SELECT Id FROM Contact WHERE FirstName = 'Test' AND LastName = 'Con SentimentControllerTest'].Id;

        SentimentController.createSentimentRecord(positiveVal, neutralVal, negativeVal, sentimentResultPos, text, contactId);
        Contact con = [SELECT Id, Number_of_Positive_Calls__c FROM Contact WHERE Id = :contactId];

        System.assertEquals(1, con.Number_of_Positive_Calls__c);
        
    }

    @isTest
    public static void contactUpdateNegAddition() {
        String todayDate = String.valueOf(system.today().format());
        String positiveVal = '0.1';
        String neutralVal = '0.2';
        String negativeVal = '0.3';
        Decimal decimalpositiveVal = Decimal.valueof('0.1');
        Decimal decimalneutralVal = Decimal.valueof('0.2');
        Decimal decimalnegativeVal = Decimal.valueof('0.3');
        String sentimentResultNeg = 'NEGATIVE';
        String sentimentResultNK = 'UnknowRandomString';
        String text = 'Test class method text for analysis.' + todayDate;
        String contactId = [SELECT Id FROM Contact WHERE FirstName = 'Test' AND LastName = 'Con SentimentControllerTest'].Id;

        SentimentController.createSentimentRecord(positiveVal, neutralVal, negativeVal, sentimentResultNeg, text, contactId);
        Contact con = [SELECT Id, Number_of_Negative_Calls__c FROM Contact WHERE Id = :contactId];

        System.assertEquals(1, con.Number_of_Negative_Calls__c);
    }

    @isTest
    public static void DMLErrorTest() {
        String todayDate = String.valueOf(system.today().format());
        String positiveVal = '0.1';
        String neutralVal = '0.2';
        String negativeVal = '0.3';
        Decimal decimalpositiveVal = Decimal.valueof('0.1');
        Decimal decimalneutralVal = Decimal.valueof('0.2');
        Decimal decimalnegativeVal = Decimal.valueof('0.3');
        String sentimentResultPos = 'POSITIVE';
        String text = 'Test class method text for analysis.' + todayDate;
        String contactId = [SELECT Id FROM Contact WHERE FirstName = 'Test' AND LastName = 'Con SentimentControllerTest'].Id;

        Id readOnlyProfile = [SELECT Id FROM Profile WHERE name ='Read Only'].Id;

        User u = new user(
                            LastName = 'Test Code',
                            Email = 'test@test.com',
                            Alias = 'Tcode',
                            Username = 'test1234@test.com.JonathanFox' + Math.floor(Math.random() * Math.floor(100)),
                            CommunityNickname = 'test12',
                            LocaleSidKey = 'en_US',
                            TimeZoneSidKey = 'GMT',
                            ProfileID = readOnlyProfile,
                            LanguageLocaleKey = 'en_US',
                            EmailEncodingKey = 'UTF-8'
                        );
        insert u;

        System.runAs(u){

            try{
                SentimentController.createSentimentRecord(positiveVal, neutralVal, negativeVal, sentimentResultPos, text, contactId);
            }catch(Exception e){
                Boolean errorNull = (e == null) ? true : false; 
                System.assert(errorNull == false);
                System.assertEquals('List has no rows for assignment to SObject', e.getMessage());
            }
        }
    }
}
