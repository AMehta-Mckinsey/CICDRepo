@isTest
public class LeadProcessorTest {
    
    @testSetup 
    static void setup() {
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 0; i < 200 ; i++){
            Lead l = new Lead();
            l.lastName = 'Test ' + i;
            l.company = 'Test ' + i;
            leadList.add(l);
        }
        Insert leadList;
    }
    
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor l = new LeadProcessor();
        Id batchId = Database.executeBatch(l);
        Test.stopTest();
    }
}