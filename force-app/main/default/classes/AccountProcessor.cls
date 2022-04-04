public class AccountProcessor {
  @future
  public static void countContacts(List<Id> acctIds) {
    List<Account> accUpd = new List<Account>();
    List<Account> accountRec = new List<Account>();
    List<Contact> con = new List<Contact>();
    System.debug('Checking for CICD----1');
    accountRec = [
      SELECT Id, Number_of_Contacts__c
      FROM Account
      WHERE Id IN :acctIds
    ];
    con = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :acctIds];
    for (Account a : accountRec) {
      for (Contact c : con) {
        if (c.AccountId == a.Id) {
          if (a.Number_of_Contacts__c == null)
            a.Number_of_Contacts__c = 0;
          a.Number_of_Contacts__c = a.Number_of_Contacts__c + 1;
        }
      }
      accUpd.add(a);
    }
    update accUpd;
  }
}
