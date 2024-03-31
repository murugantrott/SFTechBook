trigger CreateContact on Account (after insert) {

  list<contact> conlist = new list<contact>();
  
  for (account accobj: trigger.new){
      contact conobj = new contact();
      conobj.lastname = accobj.name;
      conobj.accountId = accobj.Id;
      conlist.add(conobj);
   }
   if(!conlist.isEmpty()){
      insert conlist;
   }      

}