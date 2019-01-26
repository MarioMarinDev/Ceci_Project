/// scr_dev_information

// Local variables
var font = fnt_dev;
var xx = 5;
var yy = 5;
var ys = font_get_size(fnt_dev) + 1;

// Draw setup
draw_set_color(c_white);
draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_rectangle_dim(0, 0, view_wport[0], y_max, 0.4, c_black);

// Draw developer information
draw_text(xx, yy, string(fps) + " DEVELOPER MODE (" + room_get_name(room) + ")"); yy += ys;
if(instance_exists(room_controller)){
	draw_text(xx, yy, "RoomController is Active"); yy += ys;
}
draw_text(xx, yy, "Instances: " + string(instance_count)); yy += ys;

// Get max height ( ALWAYS LAST )
y_max = yy + ys;