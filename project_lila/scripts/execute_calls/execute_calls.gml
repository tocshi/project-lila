/// @description Executes all calls in a call list. Must be a call list and not just a call.
//  If you want to execute a single call, you can create a singleton call list with single_call


var arr = argument0;
var ret = -1;
for (var i = 0; i < array_length_1d(arr); ++i) {
	ret = script_execute_array(arr[i]);
}
return ret;
