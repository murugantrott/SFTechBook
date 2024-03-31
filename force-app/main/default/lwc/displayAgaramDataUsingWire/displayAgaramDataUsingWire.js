import { LightningElement, wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/AgaramAccController.getAccounts';

export default class DisplayAgaramDataUsingWire extends LightningElement {
    @track data;
    @wire(getAccounts) accountRecords({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}