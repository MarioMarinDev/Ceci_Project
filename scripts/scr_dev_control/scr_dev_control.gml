/// scr_dev_control

// Local variables
var key_dev = vk_f1;
var key_end = vk_escape;
var key_restart = vk_home;
var key_room_restart = vk_end;

// Turn on/off developer control
if(keyboard_check_pressed(key_dev)){
	global.dev = !global.dev;
}

// Developer game control
if(global.dev){
	
	if(keyboard_check_pressed(key_end)){
		game_end();
	}
	
	if(keyboard_check_pressed(key_restart)){
		game_restart();
	}
	
	if(keyboard_check_pressed(key_room_restart)){
		room_restart();
	}
	
}