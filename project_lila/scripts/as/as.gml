

	/// @param [key_var
	/// @param val_var]

	#region optional local var
	if (argument_count == 2) {
		var ___key = argument[0];
		var ___value = argument[1];
	
		if (!variable_instance_exists(id, ___key)) {
			variable_instance_set(id, ___key, 0);
		}
	
		if (!variable_instance_exists(id, ___value)) {
			variable_instance_set(id, ___value, 0);
		}
	}
	#endregion
	
	// if it's last iteration, free resources
	if (global._eachCanDo[? global._eachCurrent] == 0) {
		
		// garbage collect copied resources in case of stacked ones
		if (global._eachType[? global._eachCurrent] == ds_type_stack) {
			ds_stack_destroy(global._eachVar[? global._eachCurrent ]);
		}
		if (global._eachType[? global._eachCurrent] == ds_type_queue) {
			ds_queue_destroy(global._eachVar[? global._eachCurrent ]);
		}
		if (global._eachType[? global._eachCurrent] == ds_type_priority) {
			ds_priority_destroy(global._eachVar[? global._eachCurrent ]);
		}
		
		ds_map_delete(global._eachCanDo, global._eachCurrent);
		ds_map_delete(global._eachType, global._eachCurrent);
		ds_map_delete(global._eachVar, global._eachCurrent);
		ds_map_delete(global._eachPos, global._eachCurrent);
		ds_map_delete(global._eachSize, global._eachCurrent);
		ds_map_delete(global._eachKey, global._eachCurrent);
		
		ds_stack_pop(global._eachStack);
		global._eachCurrent = ds_stack_top(global._eachStack);
		
		
		return false; // end
	}
	
	// otherwise, get values
		
	var ___k = -1;
	var ___v = -1;
		
	switch(global._eachType[? global._eachCurrent] ) {
		case ds_type_array:
			___k = global._eachPos[? global._eachCurrent];
			var _arr = global._eachVar[? global._eachCurrent];
			___v = _arr[ global._eachPos[? global._eachCurrent] ];
			break;
		case ds_type_map:
			___k = global._eachKey[? global._eachCurrent];
			___v = ds_map_find_value(global._eachVar[? global._eachCurrent], global._eachKey[? global._eachCurrent]);
			break;
		case ds_type_list:
			___k = global._eachPos[? global._eachCurrent];
			___v = ds_list_find_value(global._eachVar[? global._eachCurrent], global._eachPos[? global._eachCurrent]);
			break;
		case ds_type_stack:
			//___v = ds_stack_top(global._eachVar[? global._eachCurrent]);
			___v = ds_stack_pop(global._eachVar[? global._eachCurrent]);
			___k = ds_stack_size(global._eachVar[? global._eachCurrent]);
			break;
		case ds_type_queue:
			___v = ds_queue_dequeue(global._eachVar[? global._eachCurrent]);
			___k = global._eachSize[? global._eachCurrent] - ds_queue_size(global._eachVar[? global._eachCurrent]) - 1;
			break;
		case ds_type_grid:
			var _w = ds_grid_width(global._eachVar[? global._eachCurrent]);
			var _x = global._eachPos[? global._eachCurrent] % _w;
			var _y = global._eachPos[? global._eachCurrent] div _w;
			
			___k = string(_x) + "," + string(_y);
			___v = ds_grid_get(global._eachVar[? global._eachCurrent], _x, _y);
			break;
		case ds_type_priority:
			___v = global._eachPriorityLowAsFirst ? ds_priority_find_min(global._eachVar[? global._eachCurrent]) : ds_priority_find_max(global._eachVar[? global._eachCurrent]);
			//___k = " (p=" + string(ds_priority_find_priority(global._eachVar[? global._eachCurrent], ___v)) + ")";
			___k = ds_priority_find_priority(global._eachVar[? global._eachCurrent], ___v);
			___v = global._eachPriorityLowAsFirst ? ds_priority_delete_min(global._eachVar[? global._eachCurrent]) : ds_priority_delete_max(global._eachVar[? global._eachCurrent]);
			//___k = string(global._eachSize[? global._eachCurrent] - ds_priority_size(global._eachVar[? global._eachCurrent]) - 1) + ___k;
			
			break;
	}
	
	global._eachLastKey = ___k;
	global._eachLastValue = ___v;
	
	if (argument_count == 2) {
		variable_instance_set(id, ___key, ___k);
		variable_instance_set(id, ___value, ___v);
	}
	
	return 1;