({
	doInit : function(component, event, helper) {       
        var action = component.get("c.getLead");
        action.setCallback(this, function(a){
            component.set("v.LeadRec",a.getReturnValue());
        }),
        $A.enqueueAction(action);
    }
})