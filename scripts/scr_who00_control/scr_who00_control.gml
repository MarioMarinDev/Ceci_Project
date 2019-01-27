/// scr_where00_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	mountains = object_find(obj_button, "mountains");
	text_mountains = object_find(obj_drag_text, "text_mountains");
	forest = object_find(obj_button, "forest");
	text_forest = object_find(obj_drag_text, "text_forest");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(mountains, forest, text_mountains, text_forest, btn_continue)){
		
		// Set statement
		statement_object.sentence = "en las _ hay un _"
		
		// Set sprites
		mountains.sprite = spr_elem_mountains;
		forest.sprite = spr_elem_forest;
		
		// Set text
		text_mountains.text = "montañas";
		text_forest.text = "bosque";
		
		// Hide continue button
		btn_continue.active = false;
		btn_continue.visible = false;
		
		// Set game state
		global.game_state = game.pre_play;
	}
	
}

if(global.game_state == game.pre_play){
	// Align drag texts
	if(text_mountains.width > 100 && text_forest.width > 100){
		object_horizontal_align_object(fa_center, mountains, text_mountains);
		object_horizontal_align_object(fa_center, forest, text_forest);
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
	game_add_sentence(sentences, "en las montañas hay un bosque", true, spr_ending_who00_correct0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}