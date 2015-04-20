<cfobject type="component" name="company" component="glass.controller.CompanyController">
<cfobject type="component" name="person"  component="glass.controller.PersonController">
<cfobject type="component" name="contact" component="glass.controller.ContactController">
<cfset companyList = company.find({})>

<html>
	<head>
		<title>
			Glass & Lewis - Companies & Contacts
		</title>
		
		<link href="css/glassStyles.css" rel="stylesheet" media="screen"/>
	</head>
	
	<body>
		<section>
			<cfoutput>
				<cfloop array="#companyList#" index="comp">
			<ul>
				<li>#comp.getName()#</li>
				<li>#comp.getAddress()#</li>
				<li>#comp.getCity().getName()#, #comp.getCity().getState().getAbbreviation()#</li>
				<li>#comp.getTelephone()#</li>
				<li><a href="#comp.getURL()#" target="_blank">#comp.getURL()#</a></li>
			</ul>
					<cfset personList = person.find({company : comp})>
					<cfloop array="#personList#" index="pers">
						<cfset mainContact = contact.findOne({person : pers, main : YES})>
			<table>
				<tr>
					<td>#pers.getName()# (show Person.photo onMouseOver)</td>
					<td>#mainContact.getTelephone()#</td>
					<td><a href="mailto:#mainContact.getEmail()#">#mainContact.getEmail()#</a></td>
				</tr>
			</table>
					</cfloop>
				</cfloop>
			</cfoutput>
		</section>
	</body>
</html>