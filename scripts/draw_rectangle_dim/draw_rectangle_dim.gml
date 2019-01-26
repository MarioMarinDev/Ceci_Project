/// draw_rectangle_dim
/// @args x1,y1,x2,y2,alpha,color

// Arguments
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var alpha = argument4;
var color = argument5;

// Local variables
var last_alpha = draw_get_alpha();
var last_color = draw_get_color();

// Setup color and alpha
draw_set_alpha(alpha);
draw_set_color(color);

// Draw the rectangle
draw_rectangle(x1, y1, x2, y2, false);

// Return to the last used settings
draw_set_alpha(last_alpha);
draw_set_color(last_color);