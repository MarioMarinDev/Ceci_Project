/// text_render

// Draw setup
draw_set_font(font);
draw_set_color(font_color);
draw_set_halign(halign);
draw_set_valign(valign);

// Local variables
var xx = x;
var yy = y;
var xc = bbox_left + ((bbox_right - bbox_left) / 2);
var yc = bbox_top + ((bbox_bottom - bbox_top) / 2);

#region Alignment
	switch(halign){
		case fa_left: xx = bbox_left; break;
		case fa_middle: xx = xc; break;
		case fa_right: xx = bbox_right; break;
	}
	switch(valign){
		case fa_top: yy = bbox_top; break;
		case fa_center: yy = yc; break;
		case fa_bottom: yy = bbox_bottom; break;
	}
#endregion

// Draw the text
draw_text(xx, yy, text);