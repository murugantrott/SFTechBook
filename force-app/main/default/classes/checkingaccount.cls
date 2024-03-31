@RestResource(urlMapping='/ShowAccountDetails/*')
global class checkingaccount{

     @HttpGet
     global static account doGet(){
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        string accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') +1);
        System.debug('account id :' +accountId);
        
        account result = [select id, name, phone from account where Id =: accountId];
        return result;
       
     }    
     
     @HttpPost
     global static string doPost(string Name, String Phone, String AccountNumber){
        
        account acc = new account();
        acc.name = Name;
        acc.phone = Phone;
        acc.accountnumber = AccountNumber;
        
        insert acc;
        return acc.id;
        
     }
     
     @HttpDelete
     global static void doDelete(){
       
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        string accnum = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        account acc = [select id, name, phone from account where accountnumber =: accnum];
        delete acc;
        
     }            
      
}