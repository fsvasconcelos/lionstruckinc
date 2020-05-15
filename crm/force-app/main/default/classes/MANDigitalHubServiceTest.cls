@isTest
public class MANDigitalHubServiceTest {
    @isTest(SeeAllData=true) static void testGetCallout() {
        // Test.setMock(HttpCalloutMock.class, new DigitalServiceHttpCalloutMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.

        Account a = [select Id from Account limit 1];
     	Product2 newProduct = new Product2(Name = 'newProduct', Vin__c ='WMAH05ZZZ4B011671');
		insert newProduct;
        Asset[] ast = new Asset[]{};

        Asset myAsset = new Asset(Name = 'newAsset', Product2 = newProduct, AccountId = a.Id, SerialNumber = 'MAN-DIGI-007');
        ast.add(myAsset);
        insert ast;
        MANDigitalHubService.getExternalService(myAsset.Id);    
        // Verify that the response received contains fake values
        Asset actualValue = [SELECT Id,Product2.Vin__c,SerialNumber FROM Asset WHERE Id =:myAsset.Id LIMIT 1];
        String expectedValue = 'MAN-DIGI-007';
        System.assertEquals(actualValue.SerialNumber, expectedValue);
    }
}