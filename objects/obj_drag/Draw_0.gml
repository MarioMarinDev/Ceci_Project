/// @desc: Render Drag

// Draw hover effect
if(hover){
	draw_rectangle_width(bbox_left, bbox_top, bbox_right, bbox_bottom, 4, true, color_hover);
}

// Draw sprite
if(sprite_exists(sprite)){
	var ww = sprite_width_fit_object(sprite, id);
	var hh = sprite_height_fit_object(sprite, id);
	draw_sprite_ext(sprite, image_index, x, y, ww, hh, image_angle, image_blend, image_alpha);
}

#region Developer
if(global.dev){
	draw_self();
}
#endregion