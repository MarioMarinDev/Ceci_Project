/// scr_where00_control

// Room setup
if(global.game_state == game.setup){
	
	// Look for objects in the room
	statement_object = object_find(obj_statement, "statement");
	house = object_find(obj_button, "house");
	text_house = object_find(obj_drag_text, "text_house");
	sleep = object_find(obj_button, "sleep");
	text_sleep = object_find(obj_drag_text, "text_sleep");
	dog = object_find(obj_button, "dog");
	text_dog = object_find(obj_drag_text, "text_dog");
	text_in = object_find(obj_drag_text, "text_in");
	btn_continue = object_find(obj_button, "btn_continue");
	
	if(objects_exists(house, sleep, text_house, text_sleep, btn_continue)){
		
		// Set statement
		statement_object.sentence = "_ _ _ _";
		
		// Set sprites
		house.sprite = spr_elem_dog_house;
		sleep.sprite = spr_elem_sleep;
		dog.sprite = spr_elem_dog;
		
		// Set text
		text_house.text = "su casa";
		text_sleep.text = "duerme";
		text_dog.text = "el perro";
		text_in.text = "en";
		
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
	if(text_house.width > 100 && text_sleep.width > 100){
		object_horizontal_align_object(fa_center, house, text_house);
		object_horizontal_align_object(fa_center, sleep, text_sleep);
		object_horizontal_align_object(fa_center, dog, text_dog);
		object_horizontal_align_object(fa_center, btn_continue, text_in);
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
	game_add_sentence(sentences, "el perro duerme en su casa", true, spr_ending_where03_correct0);
	game_add_sentence(sentences, "en su casa duerme el perro", true, spr_ending_where03_correct0);
	game_add_sentence(sentences, "el perro en su casa duerme", true, spr_ending_where03_correct0);
	game_add_sentence(sentences, "en su casa el perro duerme", true, spr_ending_where03_correct0);
	game_add_sentence(sentences, "duerme en su casa el perro", true, spr_ending_where03_correct0);
	game_add_sentence(sentences, "duerme el perro en su casa", true, spr_ending_where03_correct0);
	
	game_add_sentence(sentences, "en el perro duerme su casa", false, spr_ending_where03_wrong0);
	game_add_sentence(sentences, "su casa en el perro duerme", false, spr_ending_where03_wrong0);
	game_add_sentence(sentences, "su casa duerme en el perro", false, spr_ending_where03_wrong0);
	game_add_sentence(sentences, "en el perro su casa duerme", false, spr_ending_where03_wrong0);
	game_add_sentence(sentences, "duerme su casa en el perro", false, spr_ending_where03_wrong0);
	game_add_sentence(sentences, "duerme en el perro su casa", false, spr_ending_where03_wrong0);
	
	game_check_sentence(sentences, statement_get_sentence(statement_object));
	global.game_state = game.stop;
	
}