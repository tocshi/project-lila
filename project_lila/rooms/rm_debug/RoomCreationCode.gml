instance_create_layer(1216,896,"Instances",global.lastClass);
restore_player_equips();

var runner0 = instance_create_layer(0,0,"Instances",obj_debug_runner);

var runner1 = instance_create_layer(0,0,"Instances",obj_debug_runner);
runner1.second = true;

var shooter0 = instance_create_layer(2800,200,"Instances",obj_debug_shooter);
shooter0.direction = 180;

var shooter1_0 = instance_create_layer(2400,384,"Instances",obj_debug_shooter);
var shooter1_1 = instance_create_layer(2800,384,"Instances",obj_debug_shooter);
shooter1_1.direction = 180;

var shooter2 = instance_create_layer(2800,600,"Instances",obj_debug_shooter);
shooter2.direction = 180;
var shooter3 = instance_create_layer(2832,632,"Instances",obj_debug_shooter);
shooter3.direction = 180;
var shooter4 = instance_create_layer(2800,664,"Instances",obj_debug_shooter);
shooter4.direction = 180;

var shooter5 = instance_create_layer(2800,1000,"Instances",obj_debug_shooter);
shooter5.direction = 180;
var ally0 = instance_create_layer(2400,1000,"Instances",obj_debug_ally);

instance_create_layer(160,1632,"Instances",obj_debug_chaser);

with(instance_create_layer(1200,1060,"Instances",obj_door_parent)){
	dest = rm_demo;
	image_yscale = 0.5;
	image_alpha = 0.7;
	sprite_index = spr_debug_indicator;
	image_blend = c_blue;
}