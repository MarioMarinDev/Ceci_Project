/// @desc: Render Button

// Local variables
var xc = bbox_left + ((bbox_right - bbox_left) / 2);
var yx = bbox_top + ((bbox_bottom - bbox_top) / 2);

// Draw hover effect
if(hover){
	draw_rectangle_width(bbox_left, bbox_top, bbox_right, bbox_bottom, 4, true, color_hover);
}

// Draw text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font);
draw_set_color(font_color);
draw_text(xc, yx, text);

// Draw sprite
if(sprite_exists(sprite)){
	var ww = sprite_width_fit_object(sprite, id);
	var hh = sprite_height_fit_object(sprite, id);
	draw_sprite_ext(sprite, image_index, x, y, ww, hh, image_angle, image_blend, image_alpha);
}

// Select color
if pressed image_blend = merge_color(color, color_pressed, 0.33);
else image_blend = color;

#region Developer
if(global.dev){
	draw_self();
}
#endregion