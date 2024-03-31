public class Soap_Example {

    public string userName {get; set;}
    public string password {get; set;}
    public string accName {get; set;}
    public string industry {get; set;}
    public string result {get; set;}
    public string status {get; set;}
    
    public void login() {
        /* Generate the sessionId using login method from Soap class */
        Partner_Example.Soap sp= new Partner_Example.Soap();
        /*In the login method we need to pass username, password+securitytT*/
        Partner_Example.LoginResult loginDetails = sp.login(username, password);
        result = 'SessionId:' +loginDetails.sessionId;
        /*create an object for SessionHeader_Element in the Service_example class
		 *assign the sessionId generated in the above step to this head element */        
        Service_Example.SessionHeader_element head = new Service_Example.SessionHeader_element();
        head.sessionId = loginDetails.sessionId;
        /* create object for the Soap_Demo class and invoke the service */
        Service_Example.Soap_Demo service = new Service_Example.Soap_Demo();
        /* SessionHeader object we have created in the above step should be assigned to service.sessionHeader */
        service.SessionHeader=head;
        status = service.create(accname, industry);
        
    }
}