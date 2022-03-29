trigger OnUpdateTrigger on Expense__c (before Update) {
   if (trigger.isBefore && trigger.isUpdate){
      for (Expense__c expense : Trigger.New) {
      
         if (expense.Client__c != 'OkToUpdate') {
            system.debug('Record: ' + expense.Client__c + 'failed to update');
            expense.addError('You cant update this record');
            continue;
         }
         system.debug('Successfully Updated Record: ' + expense.Client__c);
      }
   }
}