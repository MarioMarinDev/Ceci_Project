/// draw_roundrect_width
/// @args x1,y1,x2,y2,width,outline,color

// Arguments
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var width = argument4;
var outline = argument5;
var color = argument6;

// Local variables
var last_color = draw_get_color();

// Draw setup
draw_set_color(color);

// Draw the roundrect
for(var i = -(width / 2); i < width / 2; i++){
	draw_rectangle(x1 + i, y1 + i, x2 + i, y2 + i, outline);
}

// Return the the last used draw settings
draw_set_color(last_color);