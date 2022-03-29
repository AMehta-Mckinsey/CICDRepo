@isTest
public class AddPrimaryContactTest {
 
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                BillingState = 'NY'
            ));
        }
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                BillingState = 'CA'
            ));
        }
        Insert accounts;
        
        Contact c = new Contact();
        c.lastName = 'Test';
        Insert c;
    }
    
    static testmethod void testQueueable() {
        Contact c = [Select Id, AccountId from Contact];
        AddPrimaryContact primaryContact = new AddPrimaryContact(c, 'CA');
        Test.startTest();        
        System.enqueueJob(primaryContact);
        Test.stopTest();        
    }
}