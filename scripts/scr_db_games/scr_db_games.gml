/// scr_db_games

global.games = ds_map_create();

#region WHERE
	var where = ds_list_create();
	ds_list_add(where, rm_where_00);
	ds_list_add(where, rm_where_01);
	ds_list_add(where, rm_where_02);
	ds_list_add(where, rm_where_03);
	
	ds_map_add(global.games, "where", where);
#endregion

#region
	var when = ds_list_create();
	ds_list_add(when, rm_when_00);
	//ds_list_add(when, rm_when_01);
	//ds_list_add(when, rm_when_02);
	//ds_list_add(when, rm_when_03);
	
	ds_map_add(global.games, "when", when);
#endregion

#region WHO
	var who = ds_list_create();
	ds_list_add(who, rm_who_00);
	ds_list_add(who, rm_who_01);
	ds_list_add(who, rm_who_02);
	ds_list_add(who, rm_who_03);
	
	ds_map_add(global.games, "who", who);
#endregion