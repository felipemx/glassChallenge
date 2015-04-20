component  hint="Contact's information" output="false" persistent="true" table="contact" 
{
	property name="id" type="numeric"
		persistent="true" ormtype="integer" 
		fieldtype="id" column="id" generator="increment" length="10" notnull="true";

	property name="main" type="boolean" displayname="Main Contact"
		persistent="true" ormtype="boolean" 
		fieldtype="column" column="main" notnull="true" validate="boolean";
		
	property name="email" type="string" displayname="Contact's email"
		persistent="true" ormtype="string" 
		fieldtype="column" column="email" length="255" notnull="false" validate="email";

	property name="telephone" type="string" displayname="Contact's telephone"
		persistent="true" ormtype="string" 
		fieldtype="column" column="telephone" length="30" notnull="false" validate="telephone";

	property name="address" type="string" displayname="Contact's address"
		persistent="true" ormtype="string" 
		fieldtype="column" column="address" length="255" notnull="true";
	
	//Relationships
	property name="person" type="any" setter="false"  
		fieldtype="many-to-one" fkcolumn="person_id" cfc="Person" lazy="false";
		
	property name="city" type="any" setter="false"  
		fieldtype="many-to-one" fkcolumn="city_id" cfc="City" lazy="false";     

	public numeric function getId()
	{
		return this.id;
	}

	public void function setId( required numeric argId )
	{
		this.id = arguments.argId;
	}

	public boolean function getMain()
	{
		return this.main;
	}

	public void function setMain( required boolean argMain )
	{
		this.main = arguments.argMain;
	}

	public string function getEmail()
	{
		return this.email;
	}

	public void function setEmail( required string argEmail )
	{
		this.email = arguments.argEmail;
	}

	public string function getTelephone()
	{
		return this.telephone;
	}

	public void function setTelephone( required string argTelephone )
	{
		this.telephone = arguments.argTelephone;
	}

	public string function getAddress()
	{
		return this.address;
	}

	public void function setAddress( required string argAddress )
	{
		this.address = arguments.argAddress;
	}

}