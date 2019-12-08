x = anchor.x;
y = anchor.y;
if((skill >= 0) && (iter % 2 == 0)){
	skill--;
	if(skill == 0){
		instance_destroy();
		exit;
		}
	image_angle += (angle/(room_speed/atkmap[? "atkspeed"]));
}

if((skill >= 0) && (iter % 2 == 1)){
	skill--;
	if(skill == 0){
		instance_destroy();
		exit;
		}
	image_angle -= (angle/(room_speed/atkmap[? "atkspeed"]));
}

