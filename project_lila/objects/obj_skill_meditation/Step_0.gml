if(target == 0){exit;}
else if(!instance_exists(target)){
	instance_destroy();
	exit;
}
if(target.highRegenThreshold < 90){instance_destroy();}

direction = point_direction(x,y,target.x,target.y);
speed = point_distance(x,y,target.x,target.y)/16;

if(fading){image_alpha-=0.01; exit;}

if(point_distance(x,y,target.x,target.y) < 64){
	image_xscale = max(0.5,32/point_distance(x,y,target.x,target.y));
	image_yscale = image_xscale;
	image_alpha = point_distance(x,y,target.x,target.y)/256;
	speed = point_distance(x,y,target.x,target.y)/16;
}
