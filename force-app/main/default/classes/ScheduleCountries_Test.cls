@isTest
public class ScheduleCountries_Test {
public static testMethod void testschedule() {

Test.StartTest();
ScheduleCountries sh1 = new ScheduleCountries();

String sch = '0 0 23 * * ?'; system.schedule('Test Countries', sch, sh1); 
Test.stopTest(); 
}
}