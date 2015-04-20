component  hint="Person's information" output="false" persistent="true" table="person" 
{
	property name="id" type="numeric"
		persistent="true" ormtype="integer" 
		fieldtype="id" column="id" generator="increment" length="10" notnull="true";

	property name="photo" type="string" displayname="Person's picture"
		persistent="true" ormtype="string" 
		fieldtype="column" column="photo" length="255" notnull="false";

	property name="name" type="string" displayname="Person's name"
		persistent="true" ormtype="string" 
		fieldtype="column" column="name" length="255" notnull="true";
		
	property name="contact" type="array" setter="false" 
		cfc="Contact" fieldtype="one-to-many" fkcolumn="person_id";               

	//Relationships
	property name="company" type="any" setter="false"  
		fieldtype="many-to-one" fkcolumn="company_id" cfc="Company" lazy="false";   
		
	public numeric function getId()
	{
		return this.id;
	}

	public void function setId( required numeric argId )
	{
		this.id = arguments.argId;
	}

	public string function getPhoto()
	{
		return this.photo;
	}

	public void function setPhoto( required string argPhoto )
	{
		this.photo = arguments.argPhoto;
	}

	public string function getName()
	{
		return this.name;
	}

	public void function setName( required string argName )
	{
		this.name = arguments.argName;
	}

}