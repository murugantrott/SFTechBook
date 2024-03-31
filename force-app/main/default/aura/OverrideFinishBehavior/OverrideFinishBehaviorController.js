({
	invoke : function(component, event, helper) {
        //get the record ID attribute
        var record = component.get("v.recordId");
        
        //get the lightning event that opens a record in a new tab
        var redirect = $A.get("e.force:navigateToSObject");
        
        //pass the record ID to the event
        redirect.setParams({
            "recordId" : record
        });
        
        //open the record
        redirect.fire();		
	}
})