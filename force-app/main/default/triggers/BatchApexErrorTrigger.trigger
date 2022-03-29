trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    
    List<BatchLeadConvertErrors__c> newBlc = new List<BatchLeadConvertErrors__c>();
    
    for(BatchApexErrorEvent errEvt : Trigger.new){
        BatchLeadConvertErrors__c blc = new BatchLeadConvertErrors__c ();
        blc.AsyncApexJobId__c = errEvt.AsyncApexJobId;
        blc.Records__c = errEvt.JobScope;
        blc.StackTrace__c = errEvt.StackTrace ;
        newBlc.add(blc);
    }
	Insert newBlc;
}