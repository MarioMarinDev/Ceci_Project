/// @desc: Main Variables

// Load database
rm_scripts = ds_map_create(); // Saves all room scripts
scr_db_load();
enums();

/// [ GLOBAL VARIABLES ] 
global.dev = false;

/// [ INSTANCE VARIABLES ]
y_max = 0; // Used in developer draw
room_controller_checked = false;