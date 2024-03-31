public with sharing class OpenWeatherMap {

    public string city{get;set;}
    public string temp{get;set;}
    public string pressure{get;set;}
    public string humidity{get;set;}
    public string temp_min{get;set;}
    public string temp_max{get;set;}
    

    public OpenWeatherMap(ApexPages.StandardController stdcontroller) {
       Account account = (Account)stdcontroller.getRecord();
       account = [select id, ShippingCity from Account WHERE Id =: account.id];
       
       string accountCity = account.ShippingCity;
       string apiKey = 'bb789e04ac5c422f9f8e558d880388ad';
       
       string requestEndpoint = 'http://api.openweathermap.org/data/2.5/weather';
       requestEndpoint += '?q=accountCity';
       requestEndpoint += '&units=Metric';
       requestEndpoint += '&appid='+apiKey;
       
       Http http = new Http();
       HttpRequest request = new HttpRequest();
       request.setEndpoint(requestEndpoint);
       request.setMethod('GET');
       HttpResponse response = http.send(request);
       
       If(response.getStatusCode() == 200) {
           system.debug('Response body result is+++: ' + response.getBody());
           Map<string,object> results = (Map<string,object>)JSON.deserializeUntyped(response.getBody());
           city = String.valueOf(results.get('name'));
           
           Map<string,object> mainresults = (Map<string,object>)(results.get('main'));
           temp = string.valueOf(mainresults.get('temp'));
           pressure = string.valueOf(mainresults.get('pressure')); 
           humidity = string.valueOf(mainresults.get('humidity')); 
           temp_min = string.valueOf(mainresults.get('temp_min')); 
           temp_max = string.valueOf(mainresults.get('temp_max')); 
           
        }else{
           ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error, 'There was an error in reading data');
           ApexPages.addMessage(myMsg);
        }   
 

    }

}