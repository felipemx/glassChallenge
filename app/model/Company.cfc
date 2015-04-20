component  hint="Company information" output="false" persistent="true" table="company"   
{
	property name="id" type="numeric" 
		persistent="true" ormtype="integer" 
		fieldtype="id" column="id" generator="increment" length="10" notnull="true";
	
	property name="name" type="string" displayname="Name of the company"
		persistent="true" ormtype="string"   
		fieldtype="column" column="name" length="255" notnull="true";
	
	property name="address" type="string" displayname="Address of the company"
		persistent="true" ormtype="string" 
		fieldtype="column" column="address"  length="255" notnull="false";
	
	property name="url" type="string" displayname="Company's website address"
		persistent="true" ormtype="string" 
		fieldtype="column" column="url" length="255" notnull="false";
	
	property name="telephone" type="string" displayname="Company's telephone"
		persistent="true" ormtype="string"
		fieldtype="column" column="telephone" length="30" notnull="false" validate="telephone";
		
	//Relationships
	property name="person" type="array" setter="false"   
		fieldtype="one-to-many" fkcolumn="company_id" cfc="Person";
		
	property name="city" type="any" setter="false"  
		fieldtype="many-to-one" fkcolumn="city_id" cfc="City" lazy="false"; 
		   
	public string function getId()
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

	public string function getAddress()
	{
		return this.address;
	}

	public void function setAddress( required string argAddress )
	{
		this.address = arguments.argAddress;
	}

	public string function getUrl()
	{
		return this.url;
	}

	public void function setUrl( required string argUrl )
	{
		this.url = arguments.argUrl;
	}

	public string function getTelephone()
	{
		return this.telephone;
	}

	public void function setTelephone( required string argTelephone )
	{
		this.telephone = arguments.argTelephone;
	}

}