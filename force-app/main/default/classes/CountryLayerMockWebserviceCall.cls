@isTest
global class CountryLayerMockWebserviceCall implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type','application/json');
        res.setBody('[{"name":"Canada","alpha2Code":"CA","alpha3Code":"CAN","capital":"Ottawa","region":"Americas"}, {"name":"United States of America","alpha2Code":"US","alpha3Code":"USA","capital":"Washington, D.C.","region":"Americas"}]');
       res.setStatusCode(200);
        return res;
    }
}