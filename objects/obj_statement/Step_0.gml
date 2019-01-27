/// @desc: Statement Control

#region State control
switch(state){
	case statement.generating:
	if(sentence != ""){
		#region Generate objects
			var word = "";
			for(var i = 0; i < string_length(sentence); i++){
				var char = string_char_at(sentence, i + 1);
				if(char != "_"){
					word += char;
				}else{
					if(word != ""){// Create a text object
						var new_text = instance_create_depth(room_width, room_height, depth, obj_text);
						new_text.text = word;
						ds_list_add(texts, new_text);
						ds_list_add(objects, new_text);
					}
					// Create new blank
					var new_ph = instance_create_depth(room_width, room_height, depth, obj_placeholder);
					new_ph.underline = true;
					ds_list_add(placeholders, new_ph);
					ds_list_add(objects, new_ph);
					word = "";
				}
			}
			if(word != ""){
				// Add last word
				var new_text = instance_create_depth(room_width, room_height, depth, obj_text);
				new_text.text = word;
				ds_list_add(texts, new_text);
				ds_list_add(objects, new_text);
			}
		#endregion
		state = statement.sizing;
	}
	break;
	
	case statement.sizing:
	#region Sizing objects
		draw_set_font(font);
		var height = bbox_bottom - bbox_top;
		// Change texts sizes
		for(var i = 0; i < ds_list_size(texts); i++){
			var text = ds_list_find_value(texts, i);
			var width = string_width(" " + text.text + " ");
			object_resize(text, width, height);
			width_max += width;
		}
		// Change placeholders sizes
		for(var i = 0; i < ds_list_size(placeholders); i++){
			var placeholder = ds_list_find_value(placeholders, i);
			var width = string_width(" " + text_sample + " ");
			object_resize(placeholder, width, height);
			width_max += width;
		}
	#endregion
	state = statement.ready;
	break;
	
	case statement.ready:
	#region Arrange objects
	
		// Get width max
		width_max = 0;
		for(var i = 0; i < ds_list_size(objects); i++){
			var obj = ds_list_find_value(objects, i);
			var width = obj.bbox_right - obj.bbox_left;
			width_max += width;
		}
	
		var xc = bbox_left + ((bbox_right - bbox_left) / 2);
		var xx = xc - (width_max / 2);
		var yy = bbox_top;
		for(var i = 0; i < ds_list_size(objects); i++){
			var object = ds_list_find_value(objects, i);
			object.x = xx;
			object.y = yy;
			xx += object.bbox_right - object.bbox_left;
		}
	#endregion
	break;
}
#endregion