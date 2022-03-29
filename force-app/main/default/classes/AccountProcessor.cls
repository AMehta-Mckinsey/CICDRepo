public class AccountProcessor {
	@future
    public static void countContacts(List<Id> acctIds){
        List<Account> accUpd = new List<Account>();
        List<Account> accountRec = new List<Account>();
        List<Contact> con = new List<Contact>();
        
        accountRec = [Select Id, Number_of_Contacts__c from Account where Id IN : acctIds];
        con = [Select Id, AccountId from Contact where AccountId IN : acctIds];
        for(Account a : accountRec){
            for(Contact c : con){
                if(c.AccountId == a.Id){
                    if(a.Number_of_Contacts__c == null)
                        a.Number_of_Contacts__c = 0;
                    a.Number_of_Contacts__c = a.Number_of_Contacts__c + 1;
                }
            }
            accUpd.add(a);
        }
        Update accUpd;
    }
}