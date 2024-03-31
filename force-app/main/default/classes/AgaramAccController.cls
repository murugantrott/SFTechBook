public with sharing class AgaramAccController {
    public AgaramAccController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT id, name, phone, type, industry FROM Account LIMIT 10];
    }

    @AuraEnabled
    public static List<Account> getAccountRecordsList(){
        return [SELECT id, name, phone, type, industry FROM Account LIMIT 10];
    }
}