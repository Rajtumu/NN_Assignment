@isTest
private class CountriesBatchClass_Test {
    
    static testMethod void testBatchClass() {
        
        // create test data
        List<Countries__c> countries = new List<Countries__c>();
        Countries__c c1 = new Countries__c(Name='Test 1', Alpha2Code__c='US', Alpha3Code__c='USA', Capital_City__c='Washington, D.C.', Region__c='North America');
        countries.add(c1);
        Countries__c c2 = new Countries__c(Name='Test2', Alpha2Code__c='CA', Alpha3Code__c='CAN', Capital_City__c='Washington, D.C.', Region__c='North America');
        countries.add(c2);
        
        // insert test data
        insert countries;
        
       
      
     Test.setMock(HttpCalloutMock.class, new CountryLayerMockWebserviceCall());
        
        // create batch instance and start
        Test.startTest();
        CountriesBatchClass batch = new CountriesBatchClass();
        Database.executeBatch(batch);
        Test.stopTest();
       
    }
    
}