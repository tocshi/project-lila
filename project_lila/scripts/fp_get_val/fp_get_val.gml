var val = argument0;

if (is_array(val)) { // assume all arrays are function calls (if u need to pass array, use do_return(array)
	return script_execute_array(val);
} else {
	return val;
}