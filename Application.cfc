component {

	this.path = getDirectoryFromPath(getcurrentTemplatePath());
	
	this.ormEnabled = true;
	this.ormSettings = {
		cfclocation = "app/model",
		datasource = "glassDSN",
		logsql : true 
	};
	
	this.invokeImplicitAccessor = true;
	this.name = "glassChallenge";
	
	this.mappings["/glass"] = this.path & "/app";
	this.triggerDataMember = true;

	public boolean function onApplicationStart(targetPage)
	{
	  application.resources = structNew();
	  application.resources.message = this.path & "app/resources/messages.ini";
	  return true;
	}
}