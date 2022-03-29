public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer contactNbr , String lastname){
        List<Contact> cList = new  List<Contact>();
        Integer i;
        for(i=0; i <contactNbr; i ++){
            Contact c = new Contact();
            c.FirstName = 'C' + i;
            c.LastName = lastname;
            cList.add(c);
        }
        return cList;
    }
}