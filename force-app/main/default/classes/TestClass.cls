public class TestClass {
    @AuraEnabled
    public static Account getLead() {
        Account LeadRec = new Account (Name='NewLead');
        Insert LeadRec;
    	
        //LeadRec =
    	//[SELECT FirstName FROM Lead where FirstName = "NewLead" limit 1];
    	return LeadRec;
    }        
}