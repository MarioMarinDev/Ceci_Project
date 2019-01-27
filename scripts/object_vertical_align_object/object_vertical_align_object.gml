/// @desc: object_vertical_align_object
/// @args align_type,object_reference,object_to_align

/// Arguments
var align = argument0;
var obj_reference = argument1;
var obj = argument2;

// The two objects must exists
if(objects_exists(obj, obj_reference)){
	// Align object to reference
	var obj_height = obj.bbox_bottom - obj.bbox_top;
	switch(align){
		case fa_middle:
			var reference_yc = obj_reference.bbox_top + ((obj_reference.bbox_bottom - obj_reference.bbox_top) / 2);
			obj.y = reference_yc - (obj_height / 2);
		break;
	}
}