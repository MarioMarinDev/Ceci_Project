/// objects_exists
/// @args object1,object2,object3,...,objectN

// Check if all objects exists
for(var i = 0; i < argument_count; i++){
	if(!instance_exists(argument[i])){
		return false;
	}
}

return true;