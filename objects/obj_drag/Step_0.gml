/// @desc: Drag Control

// Check if this objects is being hovered
if(active && collision_point(mouse_x, mouse_y, id, false, false)){
	hover = true;
}else hover = false;

// Check if this object is being dragged
if(hover && global.click){
	drag_x = mouse_x - x;
	drag_y = mouse_y - y;
	dragging = true;
}

#region Dragging Control
	if(dragging){
		// Move this object to mouse
		x = mouse_x - drag_x;
		y = mouse_y - drag_y;
		
		// Stop dragging
		if global.release dragging = false;
	}
#endregion