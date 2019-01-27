/// sprite_height_fit_object
/// @args sprite,object

// Arugments
var sprite = argument0;
var object = argument1;

// Get heights
if(sprite_exists(sprite) && instance_exists(object)){
	var spr_height = sprite_get_height(sprite);
	var obj_height = object.bbox_bottom - object.bbox_top;
	return obj_height / spr_height;
}

return NULL; 