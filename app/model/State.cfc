component  hint="State information" output="false" persistent="true" table="state" 
{
	property name="id" type="numeric"
		persistent="true" ormtype="integer" 
		fieldtype="id" column="id" generator="increment" length="2" notnull="true";

	property name="abbreviation" type="string" displayname="Abbreviation of state's name"
		persistent="true" ormtype="string" 
		fieldtype="column" column="abbreviation" length="2" notnull="true";
	
	property name="name" type="string" displayname="Name of the state"
		persistent="true" ormtype="string" 
		fieldtype="column" column="name" length="255" notnull="true";

	//Relationships
	property name="city" type="array" setter="false"   
		fieldtype="one-to-many" fkcolumn="state_id" cfc="City";
	
	public numeric function getId()
	{
		return this.id;
	}

	public void function setId( required numeric argId )
	{
		this.id = argumentsargId;
	}

	public string function getAbbreviation()
	{
		return this.abbreviation;
	}

	public void function setAbbreviation( required string argAbbreviation )
	{
		this.abbreviation = arguments.argAbbreviation;
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