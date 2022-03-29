public class ContactSearch {
    public static List<Contact> searchForContacts(string one, string two){
        List<Contact> c = new List<Contact>();
        for(contact c1 : [Select id, name from contact where lastname = :one and MailingPostalCode  =:two]){
            c.add(c1);
        }
        return c;
    }
}