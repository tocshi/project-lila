if(!instance_exists(user)){instance_destroy();}
skill--;
image_angle = point_direction(x,y,global.player.x,global.player.y);
direction = image_angle;
speed -= 0.4;
if(skill <= 0){
	instance_destroy();
}