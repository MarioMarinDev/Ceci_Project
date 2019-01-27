/// scr_where00_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	baby = object_find(obj_button, "baby");
	text_baby = object_find(obj_drag_text, "text_baby");
	crib = object_find(obj_button, "crib");
	text_crib = object_find(obj_drag_text, "text_crib");
	text_goes = object_find(obj_drag_text, "text_goes");
	text_outside = object_find(obj_drag_text, "text_outside");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(baby, crib, text_baby, text_crib, btn_continue)){
		
		// Set statement
		statement_object.sentence = "el _ _ a la _"
		
		// Set sprites
		baby.sprite = spr_elem_baby;
		crib.sprite = spr_elem_crib;
		
		// Set text
		text_baby.text = "bebé";
		text_crib.text = "cuna";
		text_goes.text = "va";
		text_outside.text = "fuera";
		
		// Hide continue button
		btn_continue.active = false;
		btn_continue.visible = false;
		
		// Set game state
		global.game_state = game.pre_play;
	}
	
}

if(global.game_state == game.pre_play){
	// Align drag texts
	if(text_baby.width > 100 && text_crib.width > 100){
		object_horizontal_align_object(fa_center, baby, text_baby);
		object_horizontal_align_object(fa_center, crib, text_crib);
		object_horizontal_align_object(fa_center, btn_continue, text_goes);
		object_horizontal_align_object(fa_center, btn_continue, text_outside);
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
	game_add_sentence(sentences, "el bebé va a la cuna", true, spr_ending_when00_correct0);
	game_add_sentence(sentences, "el bebé fuera a la cuna", false, spr_ending_when00_wrong0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}