public class RedirectApexClass {
	 public  static pagereference  triggerAfterDelete(){
         Pagereference pg;
         pg = new Pagereference('/apex/listbank_names');
         pg.setredirect(true);
         return pg; 
     }
}