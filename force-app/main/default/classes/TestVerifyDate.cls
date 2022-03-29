@isTest
private  class TestVerifyDate {
	@isTest static void testCheckDates1() {
        date date2= VerifyDate.CheckDates(system.today() , system.today()  + 2);
        System.assertEquals(system.today()  + 2, date2);
    }
	@isTest static void testCheckDates2() {
        date date1= VerifyDate.CheckDates(system.today() , system.today()  + 33);
        Integer totalDays = Date.daysInMonth(system.today().year(), system.today().month());
		Date lastDay = Date.newInstance(system.today().year(), system.today().month(), totalDays);
        System.assertEquals(lastDay, date1);
    }    
}