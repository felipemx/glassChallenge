component  hint="City's information" output="false" persistent="true" table="city" 
{
	property name="id" type="numeric"
		persistent="true" ormtype="integer" 
		fieldtype="id" column="id" generator="increment" length="5" notnull="true";

	property name="name" type="string" displayname="City's name"
		persistent="true" ormtype="string" 
		fieldtype="column" column="name" length="255" notnull="true";

	property name="zipCode" type="string" displayname="Zip Code of the city"
		persistent="true" ormtype="string" 
		fieldtype="column" column="zipcode" length="6" notnull="true" validate="zipcode";
	
	//Relationships
	property name="state" type="any" setter="true"  
		fieldtype="many-to-one" fkcolumn="state_id" cfc="State" lazy="false"; 
		
	property name="company" type="array" setter="false"   
		fieldtype="one-to-many" fkcolumn="city_id" cfc="Company" lazy="true";
		
	property name="contact" type="array" setter="false"   
		fieldtype="one-to-many" fkcolumn="city_id" cfc="Contact" lazy="true";

	public numeric function getId()
	{
		return this.id;
	}

	public void function setId( required numeric argId )
	{
		this.id = arguments.argId;
	}

	public string function getName()
	{
		return this.name;
	}

	public void function setName( required string argName )
	{
		this.name = arguments.argName;
	}

	public string function getZipCode()
	{
		return this.zipCode;
	}

	public void function setZipCode( required string argState )
	{
		this.zipCode = arguments.argZipCode;
	}

}