trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Asset> assetListToInsert = new List<Asset>();

    for (Opportunity op: [SELECT Id, Name, Account.Name, Account.Id,
  							(SELECT Name, Quantity, UnitPrice, TotalPrice, ServiceDate, Description, 
   								PricebookEntry.Name, PricebookEntry.Product2.Family, PricebookEntry.Product2Id FROM 
   								OpportunityLineItems) 
							FROM Opportunity WHERE Id IN :Trigger.New AND StageName =: 'Closed Won']) {

		if (((Trigger.IsUpdate) && (Trigger.oldMap.get(op.Id).StageName != 'Closed Won')) || (Trigger.IsInsert)) {
                Asset objAsset = new Asset();
                objAsset.AccountId = op.Account.Id;
                for (OpportunityLineItem objOli: op.OpportunityLineItems) {
                    objAsset.Product2Id = objOli.PricebookEntry.Product2Id;
                    objAsset.Quantity = objOli.Quantity;
                    objAsset.Price =  objOli.UnitPrice;
                    objAsset.PurchaseDate = objOli.ServiceDate;
                    objAsset.Status = 'Purchased';
                    objAsset.Description = objOli.Description;
                    objAsset.Name = objOli.Name;
                }
            
            if (objAsset.Name != null){assetListToInsert.add(objAsset);}
        }                                    
    }
    
     if (assetListToInsert.size() > 0) { 
        Insert assetListToInsert ;
    }   
}