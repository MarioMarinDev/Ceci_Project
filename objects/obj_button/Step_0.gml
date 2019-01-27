/// @desc: Button Control

// Check if this button is being hovered
if(active && collision_point(mouse_x, mouse_y, id, false, false)){
	hover = true;
}else hover = false;

// Check if this button is being presse
if(hover && global.click){
	pressed = true;
}

// Being pressed control
if(pressed){
	
	// Check for release
	if(!hover || global.release){
		pressed = false;
	}
	
	// Button type control
	switch(type){
		case button.teleporter:
			rm_goto(next_room);
		break;
	}
	
}
