@isTest(seeAllData=false)
private class Test_OpportunityLineItemCheck 
{
  static testMethod void Checkduplicate() 
  {
        Test.startTest();
		
        User currentUser = [Select Id from User where Id = :UserInfo.getUserId() limit 1];
        
        Account acc = new Account(Name = 'Partner1');

        insert acc;

        PricebookEntry[] pbes = [Select Id, UnitPrice, Pricebook2Id from PricebookEntry where IsActive = true];
            
        Opportunity opp4 = new Opportunity(Name= 'Opp31',Pricebook2Id = pbes[0].Pricebook2Id);
             
        Opportunity[] opplist=new Opportunity[]{opp4};
        insert opplist;
                        
        OpportunityLineItem oli4 = new OpportunityLineItem(OpportunityId = opp4.Id, PricebookEntryId = pbes.get(0).Id);
        
        OpportunityLineItem[] olilist=new OpportunityLineItem[]{oli4};
		
        insert olilist;

        Test.stopTest();  
  }
}