/// @desc: Render Text

text_render();

#region Developer Draw
if(global.dev){
	draw_self();
	
	var c = color_get("success");
	var xc = bbox_left + ((bbox_right - bbox_left) / 2);
	var yc = bbox_top + ((bbox_bottom - bbox_top) / 2);
	draw_circle_color(xc, yc, 2, c, c, false);
	
}
#endregion