/// @description Create an array from a list of arguments
var arr_out = array_create(argument_count);
for (var i=0; i<argument_count; ++i)
{
    arr_out[i] = argument[i];
}
return arr_out;