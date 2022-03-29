public class OpportunityLineItemCheckOperations {

    public static void checkOnOpportunityLineItems(List<OpportunityLineItem> opportunityProductList){
        
        List<OppWrapper> lstOpps = new List<OppWrapper>();
        Set<String> oppIds = new Set<String>();
        Set<String> productcodeids = new Set<String>();
        
        for (OpportunityLineItem oppline : opportunityProductList){
             productcodeids.add(oppline.productcode);
             oppIds.add(oppline.OpportunityId);
        }
        
        List<Opportunity> lstOppos = [SELECT Id, (SELECT Id, opportunityid, productcode , Product2Id FROM OpportunityLineItems WHERE productcode in :productcodeids)
                                            FROM Opportunity WHERE Id in :oppIds ];
        
        
        for (Opportunity oppor : lstOppos){
        
            for (OpportunityLineItem oppline : oppor.OpportunityLineItems){
                OppWrapper oppo = new OppWrapper();         
                oppo.OppID = oppor.Id;
                oppo.productcode = oppline.productcode;
                //oppo.ProductID = oppline.Product2Id;
                lstOpps.add(oppo);
            }
        }
        
        lstOpps.sort();
        
        for (OpportunityLineItem oppline: opportunityProductList){
            
            for(OppWrapper oppwrap :lstOpps){
                if (oppline.OpportunityId == oppwrap.OppID && oppline.productcode == oppwrap.productcode)
                    oppline.addError('This product is already added to this opportunity.You cannot add the same product again.');
            }
            
        }
        
        
    }
    
    public class OppWrapper implements Comparable{
        String OppID;
        String ProductID;
        String productcode;
        
        public Integer compareTo(Object compareTo){
            OppWrapper compareToCopy = (OppWrapper) compareTo;
            
            Integer returnValue = 0;
            
            if (this.OppID > compareToCopy.OppID)
                returnValue = 1;
                
            else if (this.OppID < compareToCopy.OppID)
                returnValue = -1;
                
            else if (this.OppID == compareToCopy.OppID){
                if (this.ProductID > compareToCopy.ProductID)
                    returnValue = 1;
                    
                else if (this.ProductID < compareToCopy.ProductID)
                    returnValue = -1;
            }
            
            return returnValue;     
        
        }
    
    }

}