public class CreateOppHandler {
    public static void createOpp(Map<id,account> newaccmap, Map<id,account> oldaccmap){
        
        list<opportunity> opplist = new list<opportunity>();
        
        for(account accObj: newaccmap.values()){
            if((newaccmap.get(accObj.id).rating != oldaccmap.get(accObj.id).rating) && 
               (newaccmap.get(accObj.id).rating == 'warm')) {
                   opportunity opp = new opportunity();
                   opp.accountId = accobj.id;
                   opp.name = accobj.name;
                   opp.Stagename = 'Prospecting';
                   opp.CloseDate = system.today();
                   opplist.add(opp);
               }
        }
       
        if(!opplist.isEmpty()){
            insert opplist;
        }
    }
}