/// @desc: Placeholder Control

// Holding object control
if(instance_exists(holding)){
	
	// Keep holding object in the center of this placeholder
	object_horizontal_align_object(fa_center, id, holding);
	object_vertical_align_object(fa_middle, id, holding);
	
	// Auto resize this placeholder
	if(auto_resize){
		var holding_width = holding.bbox_right - holding.bbox_left;
		var holding_height = sprite_get_height(sprite_index) * image_yscale; // Doesn't change height
		object_resize(id, holding_width, holding_height);
	}
	
	#region // Check if not longer is holding
	var x1 = holding.bbox_left;
	var y1 = holding.bbox_top;
	var x2 = holding.bbox_right;
	var y2 = holding.bbox_bottom;
	if(holding.dragging || !collision_rectangle(x1, y1, x2, y2, id, true, false)){
		holding = noone;
	}
	#endregion
	
}