var val = argument0;

if (is_array(val) && array_length_1d(val) == 2 && val[0] == "fp_is_value") { // assume all arrays are function calls (if u need to pass array, use do_return(array))
	return execute_calls(val[1]);
} else {
	return val;
}