/// object_find
/// @args object_type,tag

// Arguments
var object = argument0;
var tag = argument1;

// Look for the first object that finds
var objects = instance_number(object);
for(var i = 0; i < objects; i++){
	var o = instance_find(object, i);
	if(o.tag != undefined){
		if o.tag == tag return o.id;
	}
}

// Returns no object
return noone;