import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CreateRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

export default class AgaramCreateAccount_LWC extends NavigationMixin(LightningElement) {
    name='';
    phone='';

    handleChange(event){
        if(event.target.label === 'Name'){
            this.name = event.target.value;
        }
        else if (event.target.label === 'Phone'){
            this.phone = event.target.value;
        }
    }

    createAccount(){
        const fields={};
        fields[ACCOUNT_NAME.fieldApiName] = this.name;
        fields[ACCOUNT_PHONE.fieldApiName] = this.phone;
        const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };

        CreateRecord(recordInput)
            .then(account =>{
                this.accountId = account.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account created',
                        variant: 'success'
                    }),                    
                );
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: account.id,
                        objectApiName: 'Account',
                        actionName: 'view',
                    },
                });
            })

            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message(),
                        variant: 'error',
                    }),
                );
            });
    }
}