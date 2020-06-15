/// @description Creates a script call to be called later. You must provide all arguments.
// Example usage: if you want to create a call to add_item(1, 3): call(add_item, 1, 3)
//  Built-in functions do not work. If you want to use a built-in function, make a script called
// fp_name_of_built_in_call
// fp stands for function pointer


var arr = [];
for (var i = 0; i < argument_count; ++i) {
	arr[i] = argument[i];
}
return arr;