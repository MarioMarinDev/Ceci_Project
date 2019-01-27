/// game_add_sentence
/// @args ds_sentence_list,sentence,correct?,image

// Arguments
var list = argument0;
var sentence = argument1;
var is_correct = argument2;
var image = argument3;

// Create map
var new_map = ds_map_create();
ds_map_add(new_map, "sentence", sentence);
ds_map_add(new_map, "correct", is_correct);
ds_map_add(new_map, "image", image);

// Add created map to senteces list
ds_list_add(list, new_map);
