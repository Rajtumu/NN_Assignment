public without sharing class LeadTriggerHandler {

    public void beforeUpdate(List<Lead> NewLeads, Map<ID, Lead> OldLeads) {
       Map<String,Countries__c> countries=getCountries();
       
        for(Lead l:NewLeads){
            if(l.Country==countries.get(l.Country).name){
                l.country=countries.get(l.Country).name;
                l.alpha2Code__c=countries.get(l.Country).alpha2Code__c;
                  l.alpha3Code__c=countries.get(l.Country).alpha3Code__c;
                  l.Capital_City__c=countries.get(l.Country).Capital_City__c;
                  l.region__c=countries.get(l.Country).region__c;
            }
     }
    }  
    public static Map<String,Countries__c> getCountries(){
        map<string,Countries__c> countryMap=new map<string,Countries__c>();
        for(Countries__c ct:[SELECT Id, name,alpha2Code__c,alpha3Code__c,Capital_City__c,region__c FROM Countries__c]){
            countryMap.put(ct.name,ct);
        }
        return countryMap;
     }
   
   }