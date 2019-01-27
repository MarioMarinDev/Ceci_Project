/// scr_where01_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	cave = object_find(obj_button, "cave");
	text_cave = object_find(obj_drag_text, "text_cave");
	forest = object_find(obj_button, "forest");
	text_forest = object_find(obj_drag_text, "text_forest");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(cave, forest, text_cave, text_forest, btn_continue)){
		
		// Set statement
		statement_object.sentence = "en el _ hay una _"
		
		// Set sprites
		cave.sprite = spr_elem_cave;
		forest.sprite = spr_elem_forest;
		
		// Set text
		text_cave.text = "cueva";
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
	if(text_cave.width > 100 && text_forest.width > 100){
		object_horizontal_align_object(fa_center, cave, text_cave);
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
	game_add_sentence(sentences, "en el bosque hay una cueva", true, spr_ending_who01_correct0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}