public class NewCaseListController {
    public List<Case> getNewCases(){
        List<Case> getallCase =[Select Id, CaseNumber from Case where status = 'New'];
        return getallCase;
    }
}