var user = argument0;
var itemid = argument1;

if(user == global.player){
	var dist = min(point_distance(user.x,user.y,mouse_x,mouse_y),384);
	var dir = point_direction(user.x,user.y,mouse_x,mouse_y);
	user.isMoving = false;
	
	with(instance_create_layer(user.x,user.y,"Attacks",obj_attack_flashcut)){
		image_xscale = dist;
		image_angle = dir;
	}	
	var xx = user.x + dcos(dir)*dist;
	var yy = user.y - dsin(dir)*dist;
	var attempt = 0;
	while(collision_circle(xx,yy,35,obj_wall_parent,true,true)){
		xx = lerp(xx,user.x,0.02);
		yy = lerp(yy,user.y,0.02);
		attempt++;
		if(attempt >= 80){break;}
	}
	user.x = xx;
	user.y = yy;
}

return true;