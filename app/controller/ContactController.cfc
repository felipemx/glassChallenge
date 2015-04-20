component  hint="Controller for the contact"
{
	//DAO
	public array function find(required struct filter) hint="Find all contacts based on a template" output="false"
	{
		try{
			validateContact(arguments.contact, true);
			contact = entityLoad("Contact", filter);
			
			return contact;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}
	
	public Contact function findOne(required struct filter) hint="Find one contact based on a template" output="false"
	{
		try{
			validateContact(arguments.contact, false);
			contact = entityLoad("Contact",filter, true);
			
			return contact;
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}
	
	public boolean function save(required Contact contact) hint="Inserts or Updates a contact" {
		try{
			validateContact(arguments.contact, false);
			entitySave(contact);
			
			return true;	
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}
	
	public boolean function remove(required Contact contact) hint="Deletes a contact"{
		try{
			validator = new glass.utils.ValidationUtils();
			validator.validateRemove(arguments.contact);
			entityDelete(contact);
			
			return true;	
		} catch(Exception e){
			cflog (text=e.message,type="error");
			throw(e.message, "Application" );
		}
	}
	
	//Validations
	private void function validateContact(required struct contact, required boolean allowEmptyStruct){
				
		if(!(structKeyExists(arguments.contact, "id")
			|| structKeyExists(arguments.contact, "address")
			|| structKeyExists(arguments.contact, "main"))){
			
			if(!arguments.allowEmptyStruct && structIsEmpty(arguments.contact)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.empty"));
			} 
			
			if(arguments.allowEmptyStruct && !structIsEmpty(arguments.contact)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.invalid"));
			}
			
		}

		if(!isboolean(arguments.contact.main)){
			throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "attribute.invalid"));
		}
		
		if(!isObject(arguments.contact.city) || !isObject(arguments.contact.person)){
			throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "attribute.invalid"));
		}
	
		validator = new glass.utils.ValidationUtils();
		if(structKeyExists(arguments.contact, "email")){validator.validateAttributeLength(arguments.contact.email, 255);} 
		if(structKeyExists(arguments.contact, "telephone")){validator.validateAttributeLength(arguments.contact.telephone, 30);}
		if(structKeyExists(arguments.contact, "address")){validator.validateAttributeLength(arguments.contact.address, 255);}
	}	
}