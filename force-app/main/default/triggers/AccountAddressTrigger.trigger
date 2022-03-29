trigger AccountAddressTrigger on Account (before update, before insert) {

    FOR (Account ac : Trigger.New) {
        if (ac.Match_Billing_Address__c == true && ac.BillingPostalCode != null){ 
        	ac.ShippingPostalCode = ac.BillingPostalCode;
            system.debug('ShippingPostalCode ' + ac.ShippingPostalCode);
            update ac;
        }
    }
    List<Account> a = [Select Id, ShippingPostalCode from Account where Id in : Trigger.New];
    system.debug('ShippingPostalCode --- ' + a[0].ShippingPostalCode);
}