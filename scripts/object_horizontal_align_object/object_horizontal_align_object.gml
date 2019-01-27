/// @desc: object_horizontal_align_object
/// @args align_type,object_reference,object_to_align

/// Arguments
var align = argument0;
var obj_reference = argument1;
var obj = argument2;

// The two objects must exists
if(objects_exists(obj, obj_reference)){
	// Align object to reference
	var obj_width = obj.bbox_right - obj.bbox_left;
	switch(align){
		case fa_center:
			var reference_xc = obj_reference.bbox_left + ((obj_reference.bbox_right - obj_reference.bbox_left) / 2);
			obj.x = reference_xc - (obj_width / 2);
		break;
	}
}