public class apexAction {
    @InvocableMethod
    public static list<string> returnAccountNames(list<ID> ids){
        
        list<string> accountNames = new list<string>();
        list<account> accounts = [select name from Account where Id in: ids];
        
        for(account acc: accounts){ 
            accountNames.add(acc.name);
        }       
        return accountNames;
    }
}