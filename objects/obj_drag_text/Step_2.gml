/// @desc: Resize Drag

// Resize if text changes
if(text != last_text){
	draw_set_font(font);

	width = string_width(" " + text + " ");
	height = string_height(text);

	object_resize(id, width, height);
	
	last_text = text;
}