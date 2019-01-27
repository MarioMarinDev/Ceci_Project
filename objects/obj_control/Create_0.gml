/// @desc: Main Variables

// Load enums
enums();

// Load database
rm_scripts = ds_map_create(); // Saves all room scripts
scr_db_load();

/// [ GLOBAL VARIABLES ] 
global.dev = false;

global.game_state = game.setup;
global.game_category = NULL;
global.game_next_room = NULL;
global.game_next_room_state = NULL;
global.game_ending_sentence = "";
global.game_ending_image = NULL;
global.game_transition_delay = time_seconds(0.6);

global.color_text = c_black;
global.color_hover = color_get("info");
global.color_pressed = color_get("dark");

/// [ INSTANCE VARIABLES ]
y_max = 0; // Used in developer draw
room_controller_checked = false;