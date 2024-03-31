trigger DuplicateContacttrigger on Contact (before insert, before update, after undelete) {
    
    list<contact> contactlist = new list<contact>();
    set<String> newEmailSet = new Set<String>();
    set<String> existingEmailSet = new Set<String>();
    
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        contactlist = trigger.new;
    }
    if(trigger.isAfter && trigger.isUndelete){
        contactlist = trigger.new;
    }
    
    for(contact con: contactlist){
        if(con.email != null){
            newemailset.add(con.email);
        }
        
        if(trigger.isUpdate){
            contact oldcontact = (contact)trigger.oldmap.get(con.id); //map<id,sobj>
            if(oldcontact.email != con.email){
                newemailset.add(oldcontact.email);
            }
        }
    }
    
    list<contact> existingcontactlist = [select id, email from contact where email IN: newemailset AND email != null];
    
        for(contact con: existingContactlist){
            existingemailset.add(con.email);
        }
    
    for(contact con: contactlist){
        if(existingemailset.contains(con.email)){
            con.email.addError('Duplicate mail');
        }    
    }

}