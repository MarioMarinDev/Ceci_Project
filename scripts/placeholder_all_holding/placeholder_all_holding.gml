/// placeholder_all_holding

// Check if all placeholders are holding something
var phs = instance_number(obj_placeholder);
for(var i = 0; i < phs; i++){
	var ph = instance_find(obj_placeholder, i);
	if(!instance_exists(ph.holding)){
		return false;
	}
}

return true;