trigger CaseTgr on Case (before insert) {
    list<case> newcaselist = new list<case>();
    //user u = [select id, name, email from user where email = 'kim.chouard@example.com'];
    
    if(trigger.isInsert){
        for(case c: newcaselist){
            user u = [select Id, name, email from user where email = 'kim.chouard@example.com'];
            c.CreatedById = u.Id;
        }
    }
}