/// scr_where02_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	bear = object_find(obj_button, "bear");
	text_bear = object_find(obj_drag_text, "text_bear");
	cave = object_find(obj_button, "cave");
	text_cave = object_find(obj_drag_text, "text_cave");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(bear, cave, text_bear, text_cave, btn_continue)){
		
		// Set statement
		statement_object.sentence = "en _ vive _"
		
		// Set sprites
		bear.sprite = spr_elem_bear;
		cave.sprite = spr_elem_cave;
		
		// Set text
		text_bear.text = "un oso";
		text_cave.text = "la cueva";
		
		// Hide continue button
		btn_continue.active = false;
		btn_continue.visible = false;
		
		// Set game state
		global.game_state = game.pre_play;
	}
	
}

if(global.game_state == game.pre_play){
	// Align drag texts
	if(text_bear.width > 100 && text_cave.width > 100){
		object_horizontal_align_object(fa_center, bear, text_bear);
		object_horizontal_align_object(fa_center, cave, text_cave);
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
	game_add_sentence(sentences, "en la cueva vive un oso", true, spr_ending_who02_correct0);
	game_add_sentence(sentences, "en un oso vive la cueva", false, spr_ending_who02_wrong0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}