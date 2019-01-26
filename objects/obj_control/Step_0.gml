/// @desc: Main Control

// Check user input
scr_input();

// Room controller creation
if(!room_controller_checked){
	
	// Check if room has a control script
	script = ds_map_find_value(rm_scripts, room);
	if(!is_undefined(script)){
		// Create the room controller
		room_controller = instance_create_depth(x, y, depth - 100, obj_room_controller);
		// Add script to room controller
		room_controller.script = script;
	}
	
	// Do not look for controller until next room
	room_controller_checked = true;
}

// Developer control
scr_dev_control();