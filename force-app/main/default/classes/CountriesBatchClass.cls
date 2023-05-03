global class CountriesBatchClass implements Database.Batchable<sObject>,Database.AllowsCallouts {
 
    global String query = 'SELECT Id, name,alpha2Code__c,alpha3Code__c,Capital_City__c,region__c FROM Countries__c';
      
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
     }
 
     global void execute(Database.BatchableContext BC, List<Countries__c> scope) {  
        Map<string,string> currentCountriesMap=new map<string,string>();
        
        list<Countries__c>ListCountriestoUpdate=new List<Countries__c>();
       currentCountriesMap=CountryLayer_WebService_Callout.Countrieslist();
       system.debug('countries--'+currentCountriesMap);
         for(Countries__c cont : scope){
            
             if(cont.Name!=currentCountriesMap.get('name')){
                cont.Name=currentCountriesMap.get('name'); 
             } 
             if(cont.alpha2Code__c=currentCountriesMap.get('alpha2Code')){
                cont.alpha2Code__c=currentCountriesMap.get('alpha2Code'); 
             }
             if(cont.alpha3Code__c!=currentCountriesMap.get('alpha3Code')){
                cont.alpha3Code__c=currentCountriesMap.get('alpha3Code'); 
             }
             if(cont.Capital_City__c!=currentCountriesMap.get('capital')){
                cont.Capital_City__c=currentCountriesMap.get('capital'); 
             }
             if(cont.region__c!=currentCountriesMap.get('region')){
                cont.region__c=currentCountriesMap.get('region'); 
             }
             ListCountriestoUpdate.add(cont);
         }
         if(ListCountriestoUpdate.size()>0) {
          system.debug('countries to update--'+ListCountriestoUpdate);
            Update ListCountriestoUpdate; 
         }  
     }
    
    global void finish(Database.BatchableContext BC){}

}
