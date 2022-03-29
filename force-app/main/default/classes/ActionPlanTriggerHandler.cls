public class ActionPlanTriggerHandler {
    
public static void updateActionPlanName(Map<Id,Action_Plan__c> oldMap, List<Action_Plan__c> newList, Boolean isInsert, Boolean isUpdate){    
        
        system.debug('newList ' + newList) ;
        List<Id> newAccountPlanId = new List<Id>();
        List<Action_Plan__c> recordsToUpdate = new List<Action_Plan__c>();
        
        for(Action_Plan__c getAllId : newList){
            newAccountPlanId.add(getAllId.Id);  
        }
        system.debug('newAccountPlanId ' + newAccountPlanId) ;
        
        string accountPlanName;
        for(Action_Plan__c getAccountAndYear : newList){
            getAccountAndYear.Name= string.valueOf(2017) + '|';
            system.debug('getAccountAndYear.Name ' + getAccountAndYear.Name);
        }
    }
}