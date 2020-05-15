trigger AssetTrigger on Asset (after insert) {
	
    for(Asset a : Trigger.new)
    {
    	MANDigitalHubService.getExternalService(a.Id);
	}
}