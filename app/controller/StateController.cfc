component  hint="Controller for the state"
{
	//DAO
	public array function find(required struct filter) hint="Find all states based on a template" output="false"
	{
		try{
			validateState(arguments.filter, true);
			state = entityLoad("State", arguments.filter);
			
			return state;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}
	
	public State function findOne(required struct filter) hint="Find one state based on a template" output="false"
	{
		try{
			validateState(arguments.filter, false);
			state = entityLoad("State", arguments.filter, true);
			
			return state;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}
	
	//Validations
	private void function validateState(required struct state, required boolean allowEmptyStruct){
				
		if(!(structKeyExists(arguments.state, "id")
			|| structKeyExists(arguments.state, "name")
			|| structKeyExists(arguments.state, "abbreviation"))){
			
			if(!arguments.allowEmptyStruct && structIsEmpty(arguments.state)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.empty"));
			} 
			
			if(arguments.allowEmptyStruct && !structIsEmpty(arguments.state)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.invalid"));
			}
		}
	}
}