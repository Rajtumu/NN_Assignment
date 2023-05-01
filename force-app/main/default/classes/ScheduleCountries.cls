global class ScheduleCountries implements Schedulable {
   global void execute(SchedulableContext sc) {
      CountriesBatchClass b = new CountriesBatchClass(); 
      Database.executeBatch(b);
   }
}
/*

 * This is the setup we should use to run schedule every hour*
String CRON_EXP = '0 0 * * * ?'; 
ScheduleCountries sch = new ScheduleCountries(); 
system.schedule('Hourly Example Batch Schedule job', CRON_EXP, sch);
*/