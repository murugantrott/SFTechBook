public class AccountAction {
    //Adding comment to test repository
    //Adding comment to Developer repository
    @InvocableMethod
    public static list<decimal> updateAccRevenue(List<id> ids){
        
        list<opportunity> oppList = [select accountId, amount from opportunity where id =: ids[0]];
        list<account> accountlist = [select annualRevenue from account where id =: oppList[0].accountId];
        
        list<decimal> annualRevenueList = new list<decimal>();
        accountlist[0].annualRevenue = accountlist[0].annualRevenue + oppList[0].amount;
        update accountlist;
        
        annualRevenueList.add(accountlist[0].annualRevenue);
        return annualRevenueList;        
    }
}