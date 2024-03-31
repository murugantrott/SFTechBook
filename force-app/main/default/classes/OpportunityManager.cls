@RestResource(urlMapping='/Opportunities/*')
global with sharing class OpportunityManager{
   
    @HttpGet
    global static Opportunity getOpportunityById(){
        RestRequest request = RestContext.request;
        
        String oppId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Opportunity result = [SELECT Name, StageName, LeadSource, CloseDate, Probability FROM Opportunity WHERE Id =: oppId];
        return result;
    }
    
    @HttpPost
    global static ID createOpportunity(String name, String Stage, String CloseDate, String Source){
         Opportunity newOpportunity = new Opportunity(
                                             name = name,
                                             stageName = stage,
                                             leadSource = Source,
                                             closedate = Date.valueOf(CloseDate));
                                             
          insert newOpportunity;
          return newOpportunity.id;                              
     }   
     
     @HttpPut
     global static ID upsertOpportunity(String name, String Stage, String CloseDate, String Source, String Id) {
         Opportunity thisOpportunity = new Opportunity(
                                            Id = Id,
                                            name = name,
                                            stageName = stage,
                                            leadSource = Source,
                                            closedate = Date.valueOf(CloseDate));
                                            
          //Match Opportunity by id, if present.
          //Otherwise, create new opportunity.
          upsert thisOpportunity;
          return thisOpportunity.id;
      }
      
      @HttpPatch
      global static ID updateOpportunityfields(){
         RestRequest request = RestContext.request;
         String OpportunityId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
         Opportunity thisOpportunity = [SELECT Id FROM Opportunity where Id =: OpportunityId];
         
         //Deserialize the JSONstring into name-value pairs
         Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString());
         
         //Iterate through each parameter field and value
         for(String fieldName : params.keySet()) {
            //Set the field and value on the Opportunity sobject
            thisOpportunity.put(fieldName, params.get(fieldName));
          }
          update thisOpportunity;
          return thisOpportunity.id;
       }
       
}