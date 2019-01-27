/// @desc: Transition Control

if(state == transition.fade_out){
	
	if(alpha < 1){ // Check if screen is completely black
		alpha += fade_spd;
	}else{ // Change room in the darkness
		rm_reset_globals();
		room_goto(next_room);
		state = transition.fade_in;
	}
	
}else{
	
	if(alpha > 0){ // Remove the dark screen
		alpha -= fade_spd;
	}else{ // Delete this object
		instance_destroy();
	}
	
}