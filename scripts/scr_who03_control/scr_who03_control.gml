/// scr_where02_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	berries = object_find(obj_button, "berries");
	text_berries = object_find(obj_drag_text, "text_berries");
	bear = object_find(obj_button, "bear");
	text_bear = object_find(obj_drag_text, "text_bear");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(berries, bear, text_berries, text_bear, btn_continue)){
		
		// Set statement
		statement_object.sentence = "el _ come _"
		
		// Set sprites
		berries.sprite = spr_elem_berries;
		bear.sprite = spr_elem_bear;
		
		// Set text
		text_berries.text = "moras";
		text_bear.text = "oso";
		
		// Hide continue button
		btn_continue.active = false;
		btn_continue.visible = false;
		
		// Set game state
		global.game_state = game.pre_play;
	}
	
}

if(global.game_state == game.pre_play){
	// Align drag texts
	if(text_berries.width > 100 && text_bear.width > 100){
		object_horizontal_align_object(fa_center, berries, text_berries);
		object_horizontal_align_object(fa_center, bear, text_bear);
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
	game_add_sentence(sentences, "el oso come moras", true, spr_ending_who03_correct0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}