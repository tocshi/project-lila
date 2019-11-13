var target = argument0;

var effect = instance_create_layer(target.x,target.y,"Instances",obj_debug_indicator);
effect.vspeed = 1;

target.empowered_buff = false;
