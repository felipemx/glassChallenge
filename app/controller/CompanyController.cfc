component  hint="Controller for the company"
{
	//DAO
	public array function find(required struct filter) hint="Find all companies based on a template" output="false"
	{
		try{
			validateCompany(arguments.filter, true);
			company = entityLoad("Company", filter);
			
			return company;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw("An error has occurred", "Application" );
		}
	}
	
	public Company function findOne(required struct filter) hint="Find one company based on a template" output="false"
	{
		try{
			validateCompany(arguments.filter, false);
			company = entityLoad("Company",filter, true);
			
			return company;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw("An error has occurred", "Application" );
		}
	}
	
	public boolean function save(required Company company) hint="Inserts or Updates a company" {
		try{
			validateCompany(arguments.company, false);
			entitySave(company);
			
			return true;	
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw("An error has occurred", "Application" );
		}
	}
	
	public boolean function remove(required Company company) hint="Deletes a company"{
		try{
			validator = new glass.utils.ValidationUtils();
			validator.validateRemove(arguments.company);
			entityDelete(arguments.company);
			
			return true;	
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message);
		}
	}
	
	//Validations
	private void function validateCompany(required struct company, required boolean allowEmptyStruct){
				
		if(!(structKeyExists(arguments.company, "id")
			|| structKeyExists(arguments.company, "name")
			|| structKeyExists(arguments.company, "address")
			|| structKeyExists(arguments.company, "city"))){
			
			if(!arguments.allowEmptyStruct && structIsEmpty(arguments.company)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.empty"));
			} 
			
			if(arguments.allowEmptyStruct && !structIsEmpty(arguments.company)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.invalid"));
			}
			
		}
		
		if(structKeyExists(arguments.company, "city") && !isObject(arguments.company.city)){
			throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "attribute.invalid"));
		}
		
		validator = new glass.utils.ValidationUtils();
		if(structKeyExists(arguments.company, "name")){validator.validateAttributeLength(arguments.company.name, 255);}
		if(structKeyExists(arguments.company, "address")){validator.validateAttributeLength(arguments.company.address, 255);}
		if(structKeyExists(arguments.company, "url")){validator.validateAttributeLength(arguments.company.url, 255);}
		if(structKeyExists(arguments.company, "telephone")){validator.validateAttributeLength(arguments.company.telephone, 30);}
	}
	
}