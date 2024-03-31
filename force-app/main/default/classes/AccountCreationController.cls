public with sharing class AccountCreationController {
    public AccountCreationController() {    
    }

    @AuraEnabled
    public static Account createAccount(Account accRecobj){
        try{
        insert accRecobj;
        return accRecobj;
        }
        catch(exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }       
}