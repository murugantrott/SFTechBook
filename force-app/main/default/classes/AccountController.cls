public with sharing class AccountController {

    @AuraEnabled(cacheable=true)
    public static list<Account>  getAccounts(){
        System.debug('hi');
        return [select id, name, type from Account LIMIT 10];
    }   
}