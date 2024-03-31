public class sendContactToExternalSystem {
    
    public void sendContact (string firstName, string lastName, string title, string email, id id2) {
        sendDataToSalesforceChildSystem(id2);
    }
    
    @future(callout=true)
    public static void sendDataToSalesforceChildSystem(id id2) {
        contact con = [SELECT firstName, lastName, title, email FROM Contact WHERE id =: id2];
        
        partnerSoapSforceCom.Soap myPartnerSoap = new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.LoginResult partnerLoginResult = myPartnerSoap.login('butterfly@breezyair.com', 'Valparai!123geWM4hJJCFHTfruUTeKFVeSX');
        
        //sessionid
        //we need set this sessionid on the header
        //call our webservice method of the child class
        system.debug('Generated sessionId '+partnerLoginResult.sessionId);
        string sessionIdFetch = partnerLoginResult.sessionId;
        
        soapSforceComSchemasClassReceivepar.SessionHeader_element webserviceSessionHeader = new soapSforceComSchemasClassReceivepar.SessionHeader_element();
        webserviceSessionHeader.sessionId = sessionIdFetch;
        
        soapSforceComSchemasClassReceivepar.receiveParametersorg2 objA = new soapSforceComSchemasClassReceivepar.receiveParametersorg2();
        objA.SessionHeader = webserviceSessionHeader;
        
        string status = objA.createContactRecord(con.firstName, con.lastName, con.title, con.email);
        system.debug('status '+status);        
        
    }
}