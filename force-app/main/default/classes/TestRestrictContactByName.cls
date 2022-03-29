@isTest
private class TestRestrictContactByName {
	@isTest static void TestContactWIthInvalidName() {
    	Contact c = new Contact();
        c.LastName = 'INVALIDNAME';
        insert c;
        
        system.assertEquals(c.id, null);
    }
}