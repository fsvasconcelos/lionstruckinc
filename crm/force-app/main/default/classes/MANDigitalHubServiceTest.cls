@isTest
private class MANDigitalHubServiceTest {
    @isTest static  void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new DigitalServiceHttpCalloutMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse response = MANDigitalHubService.getExternalService();
        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"vin":"WMAH05ZZZ4B011671","vehicleNum":"MAN-DIGI-007","vehicleRegNum":"MAN-DH 2020","regNumCountryKey":"PT","oemVin":"JOINTHEDIGITALHUB","manufacturer":"MAN","prodCode":"X","modelRange":"MAN20","vehicleType":"18.500 ","typeVariant":"TGX","deliveryExWorkDate":"20200101","firstRegDate":"20200101","wheelBase":"12","overhang":"1222","suspension":"F23","truckAxle":"12","customerRegDate":"20170101","customerNo":"0000001","customerName":"Digital Hub Inc.","measuringPoint":{"measPoint":"KM-IS","counterReading":"0002020","mpUnit":"KM"},"vehicleTextData":{"informationText":{"textLine":"Vehicle from our MAN DIGITAL HUB"},"noteText":[{"tagColumn":"*","textLine":"Tachometer is not working properly"},{"textLine":"I am a cool salesforce techi"},{"tagColumn":"*","textLine":"Tachometer is not working properly"}]}}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());
    }
}