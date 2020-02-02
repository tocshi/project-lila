x = anchor.x;
y = anchor.y;
skill--;
if(skill == 0){
	instance_destroy();
	exit;
}
if((skill >= 0) && (iter % 2 == 0)){
	image_angle += (angle/(room_speed/atkmap[? "atkspeed"]));
}

if((skill >= 0) && (iter % 2 == 1)){
	image_angle -= (angle/(room_speed/atkmap[? "atkspeed"]));
}

