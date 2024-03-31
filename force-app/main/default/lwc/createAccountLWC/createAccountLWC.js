import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import FIELD_NAME from'@salesforce/schema/Account.Name';
import FIELD_PHONE from'@salesforce/schema/Account.Phone';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateAccountLWC extends NavigationMixin(LightningElement) {
    name='';
    phone='';
    handleChange(event){
        if(event.target.label === 'Account Name'){
            this.name = event.target.value;
        }
        else if(event.target.label === 'Account Phone'){
            this.phone = event.target.value;
        }
    }

    handleClick(){
        const fields = {};
        fields[FIELD_NAME.fieldApiName] = this.name;
        fields[FIELD_PHONE.fieldApiName] = this.phone;

        const recordInput = {apiName: ACCOUNT_OBJECT.objectApiName, fields };

        createRecord(recordInput)
           .then(account =>{
               this.accountId = account.id;
               const evt = new ShowToastEvent({
                title:'Success',
                variant:'success',
                message:'Account created'
               });
               this.dispatchEvent(evt);

               this[NavigationMixin.Navigate]({
                   type: 'standard__recordPage',
                   attributes: {
                       recordId: account.id,
                       objectApiName: 'Account',
                       actionName: 'view'
                   },
               });
           })

           .catch(error =>{
               this.dispatchEvent(
                   new ShowToastEvent({
                       title: 'Error',
                       variant: 'error',
                       message: 'error.body.message',
                   })
               );
           });
    }
}