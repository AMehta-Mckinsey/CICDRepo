@IsTest
public class AccountProcessorTest {
	@IsTest
  	public static void testAccountProcessor() {
    	Account a = new Account();
        a.Name = 'Test1';
        Insert a;
        
        Account a1 = new Account();
        a1.Name = 'Test2';
        Insert a1;
        
        Contact c1 = new Contact();
        c1.LastName = 'Con1';
        c1.AccountId = a.Id;
        Insert c1;
        
        Contact c2 = new Contact();
        c2.LastName = 'Con2';
        c2.AccountId = a.Id;
        Insert c2;
        
        List<Id> accId = new List<Id>();
        accId.add(a.Id);
        accId.add(a1.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(accId);
        Test.stopTest();
    }
}