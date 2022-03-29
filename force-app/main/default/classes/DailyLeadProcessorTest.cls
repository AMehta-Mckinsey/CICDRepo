@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    static testmethod void testScheduledJob() {
        
        List<Lead> l = new List<Lead>();
        
        for (Integer i=0; i<10; i++) {
            Lead l1 = new Lead(
                lastName = 'Lead ' + i,
                company = 'Lead ' + i
            );
            l.add(l1);
        }
        insert l;
        
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
        Test.stopTest();

    }
}