/// scr_where00_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	hare = object_find(obj_button, "hare");
	text_hare = object_find(obj_drag_text, "text_hare");
	burrow = object_find(obj_button, "burrow");
	text_burrow = object_find(obj_drag_text, "text_burrow");
	ground = object_find(obj_button, "ground");
	text_ground = object_find(obj_drag_text, "text_ground");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(hare, burrow, text_hare, text_burrow, btn_continue)){
		
		// Set statement
		statement_object.sentence = "_ vive en _ bajo _";
		
		// Set sprites
		hare.sprite = spr_elem_hare;
		burrow.sprite = spr_elem_burrow;
		ground.sprite = spr_elem_ground;
		
		// Set text
		text_hare.text = "la liebre";
		text_burrow.text = "la madriguera";
		text_ground.text = "la tierra";
		
		// Hide continue button
		if(instance_exists(btn_continue)){
			btn_continue.active = false;
			btn_continue.visible = false;
		}
		
		// Set game state
		global.game_state = game.pre_play;
	}
	
}

if(global.game_state == game.pre_play){
	// Align drag texts
	if(text_hare.width > 100 && text_burrow.width > 100){
		object_horizontal_align_object(fa_center, hare, text_hare);
		object_horizontal_align_object(fa_center, burrow, text_burrow);
		object_horizontal_align_object(fa_center, ground, text_ground)
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
	game_add_sentence(sentences, "la liebre vive en la madriguera bajo la tierra", true, spr_ending_where02_correct0);
	game_add_sentence(sentences, "la liebre vive en la tierra bajo la madriguera", false, spr_ending_where02_wrong0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}