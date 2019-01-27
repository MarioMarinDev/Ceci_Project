/// game_check_sentence
/// @args ds_sentence_list,sentece

// Argumnets
var list = argument0;
var sentence = argument1;

// Local variables
var selected_map = game_default_wrong_ending();

// Check for the sentence
var sentences = ds_list_size(list);
for(var i = 0; i < sentences; i++){
	var map = ds_list_find_value(list, i);
	var list_sentence = ds_map_find_value(map, "sentence");
	if(sentence == list_sentence){
		selected_map = map;
	}
}

// Select if win or lose && ending image
var game_state = game.lose;
if ds_map_find_value(selected_map, "correct") game_state = game.win;
global.game_next_room_state = game_state;
global.game_ending_sentence = sentence;
global.game_ending_image = ds_map_find_value(selected_map, "image");

// Check for next room
var next_room = room;

var rooms_list = ds_map_find_value(global.games, global.game_category);
var current_index = ds_list_find_index(rooms_list, room);
if(current_index < ds_list_size(rooms_list) - 1){
	if(global.game_next_room_state == game.win){
		next_room = ds_list_find_value(rooms_list, current_index + 1);
	}else{
		global.game_next_room_state = game.setup;
		next_room = room;
	}
}else{
	if(global.game_next_room_state == game.win){
		next_room = rm_menu;
	}else{
		next_room = room;
		global.game_next_room_state = game.setup;
	}
}
global.game_next_room = next_room;

// Change room
rm_goto(rm_ending);
