public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(string incoming) {
        //List<List<SObject>> searchOk = [FIND {Smith} IN ALL FIELDS RETURNING CONTACT(lastname), LEAD(name)];
        List<List<sObject>> searchList = [FIND 'Smith' IN ALL FIELDS RETURNING CONTACT(lastname), LEAD(name)];
        return searchList;
    }
}