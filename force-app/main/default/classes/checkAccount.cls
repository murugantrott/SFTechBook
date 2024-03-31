@RestResource(urlMapping='/showAccounts/*')
global class checkAccount {
     
     @HttpGet
     global static Account doGet() {
         RestRequest req = RestContext.request;
         RestResponse res = RestContext.response;
         
         String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
         System.debug('Account Id:' +accountId);
         
         Account result = [Select Id, Name, Phone, Website FROM Account WHERE Id =: accountId];
         return result;     
          
      }
      
      @HttpPost
      global static string doPost(string name, string phone, string accountnumber){
          account acc = new account();
          acc.name = name;
          acc.phone = phone;
          acc.accountnumber = AccountNumber;
          
          insert acc;
          return acc.id;
      }
      
      @HttpDelete
      global static void doDelete(){
          RestRequest req = RestContext.request;
          RestResponse res = RestContext.response;
          
          String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
          
          Account result = [select id, name from Account WHERE AccountNumber =: AccNumber];
          delete result;
          
      }    
           
}