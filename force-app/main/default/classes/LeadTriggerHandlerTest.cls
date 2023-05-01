@isTest
private class LeadTriggerHandlerTest {

    @isTest
    static void testBeforeUpdate() {
        // create test data
        List<Countries__c> countries = new List<Countries__c>();
        countries.add(new Countries__c(Name='USA', Alpha2Code__c='US', Alpha3Code__c='USA', Capital_City__c='Washington, D.C.', Region__c='North America'));
        insert countries;
        List<Lead> leads = new List<Lead>();
        leads.add(new Lead(FirstName='John', Alpha2Code__c='US',Alpha3Code__c='USA',Capital_City__c='Washington, D.C.', Region__c='North America',LastName='Doe', Country='USA',company='Test company'));
        insert leads;
        
        // call trigger handler method
        LeadTriggerHandler handler = new LeadTriggerHandler();
        Test.startTest();
      
        handler.beforeUpdate(leads, null);
        
        Test.stopTest();
        
        // verify results
        leads = [SELECT Id, Country, Alpha2Code__c, Alpha3Code__c, Capital_City__c, Region__c FROM Lead WHERE Id=:leads[0].Id];
        System.assertEquals('USA', leads[0].Country);
        System.assertEquals('US', leads[0].Alpha2Code__c);
        System.assertEquals('USA', leads[0].Alpha3Code__c);
        System.assertEquals('Washington, D.C.', leads[0].Capital_City__c);
        System.assertEquals('North America', leads[0].Region__c);
        
    }
    @isTest
    static void testBeforeUpdate1() {
        // create test data
        List<Countries__c> countries = new List<Countries__c>();
        countries.add(new Countries__c(Name='USA', Alpha2Code__c='US', Alpha3Code__c='USA', Capital_City__c='Washington, D.C.', Region__c='North America'));
        insert countries;
        List<Lead> leads = new List<Lead>();
        leads.add(new Lead(FirstName='John', Alpha2Code__c='US',Alpha3Code__c='USA',Capital_City__c='Washington, D.C.', Region__c='North America',LastName='Doe', Country='USA',company='Test company'));
        insert leads;
        
        // call trigger handler method
        LeadTriggerHandler handler = new LeadTriggerHandler();
        Test.startTest();
        system.debug('leads--'+leads);
        Lead l=new Lead(id=leads[0].id);
        l.Alpha3Code__c='USA1';
        update l;
        Test.stopTest();
        
        
    }
    
}