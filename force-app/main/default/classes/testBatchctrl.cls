@istest

public class testBatchctrl {
    static testMethod void testonupdate(){
        Batch__c b = new Batch__c (Company_Name__c = 'New1');
        Account a = NEW Account(NAME = 'New1');
        System.Debug('Before Update or insert' + b.Company_Name__c);
        try{
            insert a;
        }
        catch(DMLException e) {
        }
        try{
            update a;
        }
        catch(DMLException e) {
        }
        try{
            insert b;
        }
        catch(DMLException e) {
        }
        try{
            update b;
        }
        catch(DMLException e) {
        }
        b = [SELECT Id, Company_Name__c FROM Batch__c WHERE id = :b.id];
        System.Debug('After Update' + b.Company_Name__c);
 
    }
    static testMethod void testonupdate1(){
        Batch__c b = new Batch__c (Company_Name__c = 'New__0');
        Account a = NEW Account(NAME = 'New2');
        System.Debug('Before Update or insert' + b.Company_Name__c);
        try{
            insert a;
        }
        catch(DMLException e) {
        }
        try{
            insert b;
        }
        catch(DMLException e) {
        }
        try{
            update b;
        }
        catch(DMLException e) {
        }
        b = [SELECT Id, Company_Name__c FROM Batch__c WHERE id = :b.id];
        System.Debug('After Update' + b.Company_Name__c);
    }
}