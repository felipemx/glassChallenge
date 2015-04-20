component hint="A bunch of validation functions"
{
	public void function validateAttributeLength(required string value, required numeric length){
		if(LEN(arguments.value) > length){
			throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "attribute.invalid"));
		}
	}
	
	public void function validateRemove(required struct object){
		if(!structKeyExists(arguments.object, "id")){
			throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.unidentified"));
		} else {
			if(!isnumericDate(arguments.object.id)){
				throw(getProfileString(application.resources.message, "VALIDATION_MESSAGE", "object.unidentified"));
			}
		}
	}
}