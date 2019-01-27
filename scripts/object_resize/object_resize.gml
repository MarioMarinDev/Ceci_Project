/// object_resize
/// @args object,width,height

// Arguments
var object = argument0;
var width = argument1;
var height = argument2;

// Change object size
if(instance_exists(object)){
	var original_width = sprite_get_width(object.sprite_index);
	var original_height = sprite_get_height(object.sprite_index);
	// Set new scales
	object.image_xscale = width / original_width;
	object.image_yscale = height / original_height;
	return object;
}

// Return no object if it not exists
return noone;