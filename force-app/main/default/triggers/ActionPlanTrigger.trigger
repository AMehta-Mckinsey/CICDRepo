trigger ActionPlanTrigger on Action_Plan__c (before insert) {
   if(Trigger.isBefore){
        
        try{
            ActionPlanTriggerHandler.updateActionPlanName(Trigger.oldMap, Trigger.new, Trigger.isInsert, Trigger.isUpdate);
            system.debug('===Trigger.new=after before insert=='+Trigger.new);
            
        }catch(Exception e){
            system.debug('====Exception in Task Trigger Before Trigger : '+e.getMessage());
            throw e;
        }
        
    }
}