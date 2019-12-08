instance_create_layer(1216,896,"Instances",obj_class_knight);

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