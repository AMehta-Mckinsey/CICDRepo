public class AddPrimaryContact implements Queueable {
    private string state;
    private Contact con;
    
    public AddPrimaryContact(Contact con, string state){
        this.state = state;
        this.con = con;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> conUpd = new List<Contact>();
		List<Account> acc = [Select Id from Account where BillingState = : state];
        for(Account a : acc){
            Contact c = con.clone(false, false, false, false);
            c.AccountId = a.Id;
            c.lastName = 'Test';
            conUpd.add(c);
        }
        Insert conUpd;
    }
}