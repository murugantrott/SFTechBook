({
	doInit : function(component, event, helper) {
        //find the component whose aura:id is "flowData"
        var flow = component.find("flowData");
		
        //set input values in a variable
        var inputVariables = [
            {
                name : "recordId",
                type : "string",
                value : component.get("v.recordId")
            }
        ];
        
        //here start the flow and reference the flow's API Name
        //also you can pass input variables
        flow.startFlow("call_invocableMethod_from_screen_flow", inputVariables);        
	}
})