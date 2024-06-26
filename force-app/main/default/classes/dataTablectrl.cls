public class dataTablectrl {
    
    @AuraEnabled
     public static List<accountListWrapper> fetchAccountWrapper(){
          List<accountListWrapper> lstaccountListWrapper = new list<accountListWrapper>();
          //query account records and create 'accountListWrapper' class instance for each record.
          
          for(Account acc: [SELECT Id, Name, Industry, Type, Phone from Account limit 1000]) {
                //by default checkbox should be false.
                lstaccountListWrapper.add(new accountListWrapper(false,acc));
          }  
         
         //return the 'lstaccountListWrapper' list
         return lstaccountListWrapper;
     }   
    
    /* wrapper class */
    public class accountListWrapper {
        @AuraEnabled public boolean isChecked {get;set;}
        @AuraEnabled public account objAccount {get;set;}
        public accountListWrapper(boolean isChecked, account objAccount){
            this.isChecked = isChecked;
            this.objAccount = objAccount;
        }
    }
}