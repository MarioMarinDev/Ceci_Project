/// rm_goto
/// @args room

// Arguments
next_room = argument0;

if(!instance_exists(obj_transition) && room_exists(next_room)){ // Can't exists two transitions
	// Create transition
	trans = instance_create_depth(0, 0, depth - 100, obj_transition);
	trans.next_room = next_room;

	// Returns created transition object id
	return trans;
}

return noone;