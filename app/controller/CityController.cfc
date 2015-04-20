component  hint="Controller for the city"
{
	//DAO
	public array function find(required struct filter) hint="Find all cities based on a template" output="false"
	{
		try{
			validateCity(arguments.filter, false);
			city = entityLoad("City", arguments.filter);
			
			return city;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}
	
	public City function findOne(required struct filter) hint="Find one city based on a template" output="false"
	{
		try{
			validateCity(arguments.filter, false);
			city = entityLoad("City", arguments.filter, true);
			
			return city;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}

	//Validations
	private void function validateCity(required struct city, required boolean allowEmptyStruct){
				
		if(!(structKeyExists(arguments.city, "id")
			|| structKeyExists(arguments.city, "name")
			|| structKeyExists(arguments.city, "zipcode")
			|| structKeyExists(arguments.city, "state"))){
			
			if(!arguments.allowEmptyStruct && structIsEmpty(arguments.city)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.empty"));
			} 
			
			if(arguments.allowEmptyStruct && !structIsEmpty(arguments.city)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.invalid"));
			}
		}
	}	
}