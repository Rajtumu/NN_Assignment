public class CountryLayer_WebService_Callout {
    
   
    public static Map<String,String> Countrieslist(){
        
        // Endpoint Url using the remote site we added
        String url = 'http://api.countrylayer.com/v2/all?access_key=d15ec6fab16cd5c0d6480837cf991be1';
        
  
       Map<string,string> countriesMap=new Map<string,string>();
        
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        
       // req.setHeader('API_KEY', 'd15ec6fab16cd5c0d6480837cf991be1');
        
        string countryname;
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        
        // If the request is successful, parse the JSON response.
        if(res.getStatusCode()==200){
            
            List<Object> results = (List<Object>) JSON.deserializeUntyped(res.getBody());
        for(Object obj: results){
            Map<String, Object> mapJson = (Map<String, Object>)obj;
            countriesMap.put((string)mapJson.get('name'),(string)mapJson.get('name'));
            countriesMap.put((string)mapJson.get('alpha2Code'),(string)mapJson.get('alpha2Code'));
            countriesMap.put((string)mapJson.get('alpha3Code'),(string)mapJson.get('alpha3Code'));
            countriesMap.put((string)mapJson.get('capital'),(string)mapJson.get('capital'));
             countriesMap.put((string)mapJson.get('region'),(string)mapJson.get('region'));
               }
      system.debug('resultss--'+countriesMap);
       }
    return countriesMap;
    }
}