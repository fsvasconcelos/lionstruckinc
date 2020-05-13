public with sharing class MANDigitalHubService {

    public static HttpResponse getExternalService() {
        Blob b = Crypto.GenerateAESKey(128);
        String h = EncodingUtil.ConvertTohex(b);
        String guid = h.SubString(0,8)+ '-' + h.SubString(8,12) + '-' + h.SubString(12,16) + '-' + h.SubString(16,20) + '-' + h.substring(20);
            
        CredentialsDigitalHub__c mc = CredentialsDigitalHub__c.getInstance();
        String client = mc.client_id__c;
        String secret = mc.client_secret__c;
    
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://eu1.anypoint.mulesoft.com/mocking/api/v1/sources/exchange/assets/a9111cc7-7a75-420b-996d-c403e449fb82/man-join-data-hub/1.0.2/m/JOINTHEDIGITALHUB');
        request.setMethod('GET');
        request.setHeader('client-id', client);
        request.setHeader('client-secret', secret);
        request.setHeader('correlation-id', guid);
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {

            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results);
        }
        
        return response;
    }
}
