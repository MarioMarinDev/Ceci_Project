/// scr_where00_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	hills = object_find(obj_button, "hills");
	text_hills = object_find(obj_drag_text, "text_hills");
	clouds = object_find(obj_button, "clouds");
	text_clouds = object_find(obj_drag_text, "text_clouds");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(hills, clouds, text_hills, text_clouds, btn_continue)){
		
		// Set statement
		statement_object.sentence = "_ están encima de _"
		
		// Set sprites
		hills.sprite = spr_elem_hills;
		clouds.sprite = spr_elem_clouds;
		
		// Set text
		text_hills.text = "los cerros";
		text_clouds.text = "las nubes";
		
		// Hide continue button
		btn_continue.active = false;
		btn_continue.visible = false;
		
		// Set game state
		global.game_state = game.pre_play;
	}
	
}

if(global.game_state == game.pre_play){
	// Align drag texts
	if(text_hills.width > 100 && text_clouds.width > 100){
		object_horizontal_align_object(fa_center, hills, text_hills);
		object_horizontal_align_object(fa_center, clouds, text_clouds);
		global.game_state = game.play;
	}
}

if(global.game_state == game.play){
	
	// Change continue button visibility
	var continuable = false;
	if placeholder_all_holding() continuable = true;
	btn_continue.active = continuable;
	btn_continue.visible = continuable;
	
	// Check if the continue button is pressed
	if(btn_continue.pressed){
		global.game_state = game.finish;
	}
	
}

if(global.game_state == game.finish){
	
	// Set correct and incorrect 
	sentences = ds_list_create();
	game_add_sentence(sentences, "las nubes están encima de los cerros", true, spr_ending_where01_correct0);
	game_add_sentence(sentences, "los cerros están encima de las nubes", false, spr_ending_where01_wrong0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}