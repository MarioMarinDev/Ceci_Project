/// rm_reset_globals

// Global variables
if(global.game_next_room_state != NULL){
	global.game_state = global.game_next_room_state;
	global.game_next_room_state = NULL;
}else{
	global.game_state = game.setup;
}

// Control object variables
obj_control.room_controller_checked = false;