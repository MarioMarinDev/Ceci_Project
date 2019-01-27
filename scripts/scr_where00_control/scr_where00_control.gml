/// scr_where00_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	nest = object_find(obj_button, "nest");
	text_nest = object_find(obj_drag_text, "text_nest");
	tree = object_find(obj_button, "tree");
	text_tree = object_find(obj_drag_text, "text_tree");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(nest, tree, text_nest, text_tree, btn_continue)){
		
		// Set sprites
		nest.sprite = spr_elem_nest;
		tree.sprite = spr_elem_tree;
		
		// Set text
		text_nest.text = "el nido";
		text_tree.text = "el árbol";
		
		// Hide continue button
		btn_continue.active = false;
		btn_continue.visible = false;
		
		// Set game state
		global.game_state = game.pre_play;
	}
	
}

if(global.game_state == game.pre_play){
	// Align drag texts
	if(text_nest.width > 100 && text_tree.width > 100){
		object_horizontal_align_object(fa_center, nest, text_nest);
		object_horizontal_align_object(fa_center, tree, text_tree);
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
	game_add_sentence(sentences, "el nido está en el árbol", true, spr_ending_where00_correct0);
	game_add_sentence(sentences, "el árbol está en el nido", false, spr_ending_where00_wrong0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}