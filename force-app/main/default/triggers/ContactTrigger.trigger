trigger ContactTrigger on Contact (after insert, after update) {
    Map<Id, Contact> accountPrimaryContacts = new Map<Id, Contact>();

    // Collect the latest primary contacts for each account
    for (Contact newContact : Trigger.new) {
        if (newContact.Type__c == 'Primary' && newContact.accountId != null) {
            accountPrimaryContacts.put(newContact.AccountId, newContact);
        }
    }

    // Update the existing primary contacts to 'Others'
    if (!accountPrimaryContacts.isEmpty()) {
        List<Contact> contactsToUpdate = new List<Contact>();

        for (Contact existingPrimary : [SELECT Id, AccountId, Type__c FROM Contact WHERE AccountId IN :accountPrimaryContacts.keySet() AND Type__c = 'Primary']) {
            Contact newPrimary = accountPrimaryContacts.get(existingPrimary.AccountId);

            if (newPrimary != null && newPrimary.Id != existingPrimary.Id) {
                existingPrimary.Type__c = 'Others';
                contactsToUpdate.add(existingPrimary);
            }
        }

        // Update the existing primary contacts
        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }
    }
}