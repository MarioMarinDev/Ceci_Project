/// scr_input

// Don't check input while in transition
if(!instance_exists(obj_transition)){
	global.click = mouse_check_button_pressed(mb_left);
	global.release = mouse_check_button_released(mb_left);
	global.touch = mouse_check_button(mb_left);
}else{
	global.click = false;
	global.release = false;
	global.touch = false;
}