component  hint="Controller for the person"
{
	//DAO
	public array function find(required struct filter) hint="Find all persons based on a template" output="false"
	{
		try{
			validatePerson(arguments.filter, true);
			person = entityLoad("Person", filter);
			
			return person;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw("An error has occurred", "Application" );
		}
	}
	
	public Person function findOne(required struct filter) hint="Find one person based on a template" output="false"
	{
		try{
			validatePerson(arguments.filter, false);
			person = entityLoad("Company",filter, true);
			
			return person;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw("An error has occurred", "Application" );
		}
	}
	
	public boolean function save(required Person person) hint="Inserts or Updates a person" {
		try{
			validatePerson(arguments.person, false);
			entitySave(person);
			
			return true;	
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw("An error has occurred", "Application" );
		}
	}
	
	public boolean function remove(required Person person) hint="Deletes a person"{
		try{
			validator = new glass.utils.ValidationUtils();
			validator.validateRemove(arguments.person);
			entityDelete(person);
			
			return true;	
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw("An error has occurred", "Application" );
		}
	}
	
	//Validations
	private void function validatePerson(required struct person, required boolean allowEmptyStruct){
				
		if(!(structKeyExists(arguments.company, "id")
			|| structKeyExists(arguments.company, "name")
			|| structKeyExists(arguments.company, "company"))){
			
			if(!arguments.allowEmptyStruct && structIsEmpty(arguments.company)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.empty"));
			} 
			
			if(arguments.allowEmptyStruct && !structIsEmpty(arguments.company)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.invalid"));
			}
			
		}
		
		if(!isObject(arguments.person.company)){
			throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "attribute.invalid"));
		}
		
		validator = new glass.utils.ValidationUtils();
		if(structKeyExists(arguments.company, "name")){validator.validateAttributeLength(arguments.person.name, 255);} 
		if(structKeyExists(arguments.company, "photo")){validator.validateAttributeLength(arguments.person.photo, 255);}
	}
	
}