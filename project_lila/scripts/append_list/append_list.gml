var original = argument0;
var appended = argument1;
for(var i=0;i<ds_list_size(appended);i++) {
    ds_list_add(original, ds_list_find_value(appended, i));
}