public class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext ctx) {
        List<Lead> lList = new List<Lead>();
        for(Lead l : [Select Id, LeadSource from Lead where LeadSource  = '' limit 200]){
            l.LeadSource = 'Dreamforce';
            lList.add(l);
        }
        update lList;
    }
}