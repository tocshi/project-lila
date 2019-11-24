if(target == 0){exit;}

if(flying){
	speed -= 0.1;
	if(speed <= 0){flying = false}
	exit;
}
else{
	direction = point_direction(x,y,target.x,target.y);
	speed = point_distance(x,y,target.x,target.y)/16;
}

if(point_distance(x,y,target.x,target.y) < 64){
	image_xscale = max(1,64/point_distance(x,y,target.x,target.y));
	image_yscale = image_xscale;
	image_alpha = point_distance(x,y,target.x,target.y)/128;
	speed = point_distance(x,y,target.x,target.y)/8;
}
