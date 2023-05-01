@isTest
public class CountryLayer_WebService_Callout_Test {
	@isTest
    static void testCountries(){
        Test.setMock(HttpCalloutMock.class, new CountryLayerMockWebserviceCall());
       
        Map<string,String>response = CountryLayer_WebService_Callout.Countrieslist();
        String expected = ('[{"name":"Canada","alpha2Code":"CA","alpha3Code":"CAN","capital":"Ottawa","region":"Americas"}, {"name":"United States of America","alpha2Code":"US","alpha3Code":"USA","capital":"Washington, D.C.","region":"Americas"}]');
       
    }
}