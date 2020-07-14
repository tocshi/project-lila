with(obj_hud_message) {
	line_offset++;
}

with(instance_create_layer(0, 0, "HUDMessages", obj_hud_message)){
	self.message = argument0;
}