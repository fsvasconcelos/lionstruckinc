@isTest
global class DigitalServiceHttpCalloutMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"vin":"WMAH05ZZZ4B011671","vehicleNum":"MAN-DIGI-007","vehicleRegNum":"MAN-DH 2020","regNumCountryKey":"PT","oemVin":"JOINTHEDIGITALHUB","manufacturer":"MAN","prodCode":"X","modelRange":"MAN20","vehicleType":"18.500 ","typeVariant":"TGX","deliveryExWorkDate":"20200101","firstRegDate":"20200101","wheelBase":"12","overhang":"1222","suspension":"F23","truckAxle":"12","customerRegDate":"20170101","customerNo":"0000001","customerName":"Digital Hub Inc.","measuringPoint":{"measPoint":"KM-IS","counterReading":"0002020","mpUnit":"KM"},"vehicleTextData":{"informationText":{"textLine":"Vehicle from our MAN DIGITAL HUB"},"noteText":[{"tagColumn":"*","textLine":"Tachometer is not working properly"},{"textLine":"I am a cool salesforce techi"},{"tagColumn":"*","textLine":"Tachometer is not working properly"}]}}');
        response.setStatusCode(200);
        return response; 
    }
}