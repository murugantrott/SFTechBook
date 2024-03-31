@RestResource(urlMapping='/AccountRecord/*')
global with sharing class AccountDetails {
    @HttpGet
    global static void getAccountById(){
        string jsonstring;
        //get parameters
        string acccountId = RestContext.request.params.get('accountId');
        Account accobj = [select id, name, type, industry from account where id =: acccountId];
        jsonstring = JSON.serialize(accobj);
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(jsonstring);   
    }
}