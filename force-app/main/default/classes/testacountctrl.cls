@istest

public class testacountctrl {
    static testMethod void testonupdate(){
        Account a = NEW Account (NAME = 'okToUpd');
        System.Debug('Before Update' + a.name);
        try{
            INSERT a;
        }
        catch(DMLException e) {
        }
        try{
            UPDATE a;
        }
        catch(DMLException e) {
        }
        a = [SELECT Id, NAME FROM Account WHERE id = :a.id];
        System.Debug('After Update' + a.name);
 
        System.assertEquals('okToUpd',a.name);
    }
    static testMethod void testonupdate1(){
        Account a = NEW Account (NAME = 'okToUpd1');
        System.Debug('Before Update' + a.name);
        try{
            INSERT a;
        }
        catch(DMLException e) {
        }

        try{
            UPDATE a;
        }
        catch(DMLException e) {  
        }
        a = [SELECT Id, NAME FROM Account WHERE id = :a.id];
        System.Debug('After Update' + a.name);
        //System.assertEquals('okToUpd',a.name);            
    }
}