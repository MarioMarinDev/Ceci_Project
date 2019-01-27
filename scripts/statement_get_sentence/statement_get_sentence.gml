/// statement_object_get_sentence
/// @args statement_object_object

// Arguments
var statement_object = argument0;

// Local variables
var sentence = "";

// Check if object exists
if(instance_exists(statement_object)){
	for(var i = 0; i < ds_list_size(statement_object.objects); i++){
		var obj = ds_list_find_value(statement_object.objects, i);
		if(obj.object_index == obj_text){
			sentence += obj.text;
		}else if(obj.object_index == obj_placeholder){
			show_debug_message("placeholder");
			var obj_holding = obj.holding;
			if(instance_exists(obj_holding)){
				if(obj_holding.object_index == obj_drag_text){
					sentence += obj_holding.text;
				}
			}
		}
	}
}

return sentence;