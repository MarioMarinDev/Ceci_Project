/// @desc: Collides with drag object

// When this object is not holding anything
if(!instance_exists(holding)){
	if(global.release){
		show_debug_message("Holding");
		holding = other.id;
	}
}

// When this object is already holding something
if(instance_exists(holding)){
	
}