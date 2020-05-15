@isTest
public class MANDigitalHubServiceTest {
    @isTest(SeeAllData=true) static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new DigitalServiceHttpCalloutMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        Asset myAsset = new Asset();
        myAsset.Product2.Vin__c = 'WMAH05ZZZ4B011671';
        insert myAsset;

        MANDigitalHubService.getExternalService(myAsset.Id);
        // Verify that the response received contains fake values
        String actualValue = [SELECT Id,Product2.Vin__c,SerialNumber FROM Asset WHERE Id =:myAsset.Id LIMIT 1];
        String expectedValue = 'MAN-DIGI-007';
        System.assertEquals(actualValue.SerialNumber, expectedValue);
    }
}