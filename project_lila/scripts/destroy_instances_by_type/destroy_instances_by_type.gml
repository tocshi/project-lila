var list = ds_list_create();
for (i = 0; i < argument_count; i ++) {
	ds_list_add(list, argument[i]);
}

for(i = each(list, ds_type_list); as(); iterate()) {
	with (_val()) {
		instance_destroy();
	}
}