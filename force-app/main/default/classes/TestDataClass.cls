@isTest(SeeAllData=true)
public class TestDataClass {
    
    public static testmethod void test1()
    {
        D__C d = [Select Id, Name from D__c where Name = 'Record1'];
        d.Name = 'rr';
        system.debug('d -- ' + d);
        update d;
    }
}