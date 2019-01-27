/// sprite_width_fit_object
/// @args sprite,object

// Arugments
var sprite = argument0;
var object = argument1;

// Get widths
if(sprite_exists(sprite) && instance_exists(object)){
	var spr_width = sprite_get_width(sprite);
	var obj_width = object.bbox_right - object.bbox_left;
	return obj_width / spr_width;
}

return NULL; 