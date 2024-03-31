import { LightningElement, api } from 'lwc';
import Contact_Firstname from '@salesforce/schema/Contact.FirstName';
import Contact_Lastname from '@salesforce/schema/Contact.LastName';
import Contact_Email from '@salesforce/schema/Contact.Email';
import Contact_Phone from '@salesforce/schema/Contact.Phone';
import Contact_Account from '@salesforce/schema/Contact.AccountId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AgaramContactQuickUpdate extends LightningElement {
    @api recordId;
    @api objectApiName;
    fieldlist= [Contact_Firstname, Contact_Lastname, Contact_Email, Contact_Phone, Contact_Account];

    handleContactUpdate(event){
        const evt = new ShowToastEvent({
            title: 'Contact Updated',
            variant: 'success',
            message: 'Contact Record ' +event.detail.fields.lastName.value + 'is successfully updated',
        });
        this.dispatchEvent(evt);
    }
}