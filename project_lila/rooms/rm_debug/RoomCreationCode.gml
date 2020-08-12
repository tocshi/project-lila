instance_create_layer(1216,896,"Instances",global.lastClass);
restore_player_equips();

var shooter5 = instance_create_layer(2800,1000,"Instances",obj_debug_shooter);
shooter5.direction = 180;
var ally0 = instance_create_layer(2400,1000,"Instances",obj_debug_ally);
/*
with(instance_create_layer(1200,1060,"Instances",obj_door_parent)){
	dest = rm_demo;
	image_yscale = 0.5;
	image_alpha = 0.7;
	sprite_index = spr_debug_indicator;
	image_blend = c_blue;
}*/