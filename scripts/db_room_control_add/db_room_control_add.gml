/// db_room_control_add
/// @args room,script

// Arguments
var rm = argument0;
var script = argument1;

ds_map_add(rm_scripts, rm, script);