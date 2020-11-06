import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import submitForSentimentCheck from '@salesforce/apex/SentimentCallOut.submitForSentimentCheck';
import createSentimentRecord from '@salesforce/apex/SentimentController.createSentimentRecord';

export default class SentimentCheck extends LightningElement {
    @api recordId;
    sentimentText = '';
    positiveValue;
    neutralValue;
    negativeValue;
    sentimentResult;
    returnedResults;

    handleUserInput(event){
        this.sentimentText  = event.detail.value;
    }

    submitForCheck(){
        submitForSentimentCheck({text:this.sentimentText})
        .then(results => {
            this.positiveValue = parseFloat(results.positive).toFixed(3);
            this.neutralValue = parseFloat(results.neutral).toFixed(3);
            this.negativeValue = parseFloat(results.negative).toFixed(3);
            this.sentimentResult = results.label;
            this.returnedResults = results;

            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Sentiment Analysis Returned',
                    message: 'Your sentiment analysis results are below.',
                    variant: 'Success',
                    mode: 'dismissable'
                }),
            );

        })
        .catch((error) => {
            console.log('error >> ' + error.body.message);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Failed to get sentiment',
                    message: 'Your sentiment check failed. - ' + error.body.message,
                    variant: 'Error',
                    mode: 'dismissable'
                }),
            );
        })
    }

    clearValues(){
        this.sentimentText = '';
        this.positiveValue = '';
        this.neutralValue = '';
        this.negativeValue = '';
        this.sentimentResult = '';
        this.returnedResults = null;
    }

    addToRecord(){
        console.log(this.positiveValue);
        console.log(typeof this.positiveValue);
        createSentimentRecord({positiveValue : this.positiveValue, neutralValue : this.neutralValue, negativeValue : this.negativeValue, sentimentResult : this.sentimentResult, text : this.sentimentText, contactId : this.recordId})
        .then(results => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Sentiment Analysis Record Created',
                    message: 'Your sentiment analysis record was created.',
                    variant: 'Success',
                    mode: 'dismissable'
                }),
            );

            clearValues();

        })
        .catch((error) => {
            console.log('error >> ' + error.body.message);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Failed to create sentiment record',
                    message: 'Your sentiment creation failed. - ' + error.body.message,
                    variant: 'Error',
                    mode: 'dismissable'
                }),
            );
        })

    }
}