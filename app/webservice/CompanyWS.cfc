component  hint="Company webservice" output="true"      
{
	remote string function listAll(){
		response = "called listAll";
		return response;
	}
	
	remote string function filter(string id){
		response = "called1 filter";
		return response;
	}

	remote string function read(numeric id){
		response = "called read";
		return response;
	}

	remote string function create(){
		response = "called create";
		return response;
	}

	remote string function update(){
		response = "called update";
		return response;
	}
	
	remote string function delete(){
		response = "called delete";
		return response;
	}
}