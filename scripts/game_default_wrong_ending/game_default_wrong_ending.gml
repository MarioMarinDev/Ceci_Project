/// game_default_wrong_ending

// Create a new default map
var new_map = ds_map_create();
ds_map_add(new_map, "sentence", "");
ds_map_add(new_map, "correct", false);
ds_map_add(new_map, "image", spr_ending_default);

return new_map;