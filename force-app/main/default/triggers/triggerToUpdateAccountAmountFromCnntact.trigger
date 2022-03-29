trigger triggerToUpdateAccountAmountFromCnntact on Contact (after insert) {
    
    List<Id> allAccId = new List<Id>();
    Map<string, decimal> accountIdandAmount = new Map<string, decimal>();
    
    for(Contact c: Trigger.New){
        allAccId.add(c.AccountId);
        if(c.Type__c == 'Positive'){
            if(accountIdandAmount.containsKey('P-' + c.AccountId)){
                decimal mapValue = accountIdandAmount.get('P-'+c.AccountId) + c.Amount_X__c;
                accountIdandAmount.put('P-' +c.AccountId, mapValue);
            }
            else
                accountIdandAmount.put('P-' +c.AccountId, c.Amount_X__c);
        }
        if(c.Type__c == 'Negative'){
            if(accountIdandAmount.containsKey('N-' + c.AccountId)){
                decimal mapValue = accountIdandAmount.get('N-'+c.AccountId) + c.Amount_Y__c;
                accountIdandAmount.put('N-' +c.AccountId, mapValue);
            }
            else
                accountIdandAmount.put('N-' +c.AccountId, c.Amount_Y__c);
        }
    }
    
    for(Account a: [Select Id, Rollup_Amount_X__c, Rollup_Amount_Y__c ,Rollup_Amount__c from Account where Id In : allAccId]){
        
    }
}