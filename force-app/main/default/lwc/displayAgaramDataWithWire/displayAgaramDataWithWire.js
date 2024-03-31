import { LightningElement, track, wire } from 'lwc';
import getAccount from '@salesforce/apex/AgaramAccController.getAccounts';

export default class DisplayAgaramDataWithWire extends LightningElement {
    @track data;
    @track columns= [
        {label : 'Label', fieldName : 'Name', type: 'text'},
        {label : 'Type', fieldName : 'Type', type: 'picklist'},
        {label : 'Phone', fieldName : 'Phone', type: 'phone'},
        {label : 'Industry', fieldName : 'Industry', type: 'piclist'},
    ];
    @wire(getAccount) accountRecords({error,data}){
        if(data){
            this.data=data;
        }
        else if (error){
            this.data=undefined;
        }
    }
}