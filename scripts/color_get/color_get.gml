/// color_get
/// @args key

// Arguments
var key = argument0;

if(instance_exists(obj_control)){
	if(ds_map_exists(obj_control.colors, key)){
		return ds_map_find_value(obj_control.colors, key);
	}
}

return c_white;