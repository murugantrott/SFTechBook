import { LightningElement, track } from 'lwc';
import getAccs from '@salesforce/apex/AgaramAccController.getAccountRecordsList';

export default class AgaramDataDisplayWithImperative extends LightningElement {
    @track accountRecords;
    @track errors;
    @track columns = [
        {label:'Name', fieldName:'Name', type:'text'},
        {label:'type', fieldName:'Type', type:'text'},
        {label:'Industry', fieldName:'Industry', type:'picklist'}
    ];
    connectedCallback(){
        getAccs()
            .then(result=>{
                this.accountRecords = result;
            })
            .catch(error=>{
                this.errors = error;
            });   
    }
}