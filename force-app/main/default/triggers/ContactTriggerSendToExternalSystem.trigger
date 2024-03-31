trigger ContactTriggerSendToExternalSystem on Contact (after insert, after update) {
    
    contact obj = new contact();
    string fname;
    string lname, title, emailtest;
    id id1;
    
    contact obj2 = trigger.new[0];
    system.debug('Before the if '+obj2.lastName);
    if (obj2.lastName != '' || obj2.lastName != null) {

        system.debug('trigger called');
        sendContactToExternalSystem obj1 = new sendContactToExternalSystem();
        obj1.sendContact(obj2.firstName, obj2.LastName, obj2.Title, obj2.Email, obj2.Id);
        
    }
}