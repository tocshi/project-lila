with (instance_create_layer(x, y, "Instances", obj_breakable_wall_hitbox)) {
	visible_wall_obj = other;
	image_xscale = (sprite_width*other.image_xscale + 2)/sprite_width;
	image_yscale = (sprite_height*other.image_yscale + 2)/sprite_height;
}