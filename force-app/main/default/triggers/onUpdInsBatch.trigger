trigger onUpdInsBatch on Batch__c (before update, before insert) {
    List<Account> acts = [SELECT Name,Id FROM Account];
    Map<String,Account> act = NEW Map<String,Account>();
    FOR (Account a : acts) {
        act.put(a.Name, a);
    }
    for (Batch__c batch : Trigger.New) {
        IF (act.containsKey(batch.Company_Name__c)){
            batch.Accounts__c = act.get(batch.Company_Name__c).Id;        
        }
    }
}