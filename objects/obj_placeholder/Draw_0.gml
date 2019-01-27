/// @desc: Render Placeholder

// Draw underline
if(underline){
	var c = color_underline;
	if current c = color_underline_current;
	var x1 = bbox_left;
	var x2 = bbox_right;
	var yy = bbox_bottom
	draw_line_width_color(x1, yy, x2, yy, underline_width, c, c);
}

#region Developer
if(global.dev){
	draw_self();
}
#endregion