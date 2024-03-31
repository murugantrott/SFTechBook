import { LightningElement, api } from 'lwc';
import Contact_Firstname from '@salesforce/schema/Contact.FirstName';
import Contact_Lastname from '@salesforce/schema/Contact.LastName';
import Contact_Phone from '@salesforce/schema/Contact.Phone';
import Contact_Email from '@salesforce/schema/Contact.Email';
import Contact_Account from '@salesforce/schema/Contact.AccountId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactUpdateQuick extends LightningElement {
    @api recordId;
    @api objectApiName;
    fieldlist = [Contact_Firstname, Contact_Lastname, Contact_Phone, Contact_Email, Contact_Account];

    handleContactUpdate(event){
        const evt = new ShowToastEvent({
            title : "Contact Update",
            message : "Contact Record " +event.detail.fields.LastName.value + "is updated successfully",
            variant : "success",
        });
        this.dispatchEvent(evt);
    }
}