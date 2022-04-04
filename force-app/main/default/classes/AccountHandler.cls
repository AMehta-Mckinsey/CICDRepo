public class AccountHandler {
  public static Account insertNewAccount(String name) {
    System.debug('Checking for CICD----1');
    Account a = new Account();
    a.Name = 'name';

    try {
      insert a;
    } catch (Exception e) {
      return null;
    }
    return a;
  }
}
