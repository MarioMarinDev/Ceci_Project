/// scr_menu_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	btn_where = object_find(obj_button, "btn_where");
	btn_when = object_find(obj_button, "btn_when");
	btn_who = object_find(obj_button, "btn_who");
	
	if(objects_exists(btn_where, btn_when, btn_who)){
		global.game_state = game.play;
	}
	
}

// Control loop
if(global.game_state == game.play){
	
	var any_pressed = false;
	
	// Check for buttons pressed
	if(btn_where.pressed){
		global.game_category = "where";
		rm_goto(rm_where_00);
		any_pressed = true;
	}
	
	if(btn_when.pressed){
		global.game_category = "when";
		rm_goto(rm_when_00);
		any_pressed = true;
	}
	
	if(btn_who.pressed){
		global.game_category = "who";
		rm_goto(rm_who_00);
		any_pressed = true;
	}
	
	if any_pressed global.game_state = game.win;
	
}