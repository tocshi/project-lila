image_alpha = point_distance(x,y,global.player.x,global.player.y)/64;
image_xscale = point_distance(x,y,global.player.x,global.player.y)/64;
image_yscale = point_distance(x,y,global.player.x,global.player.y)/64;
image_xscale = clamp(image_xscale,0,1);
image_yscale = clamp(image_yscale,0,1);
if(image_alpha <= 0 || !global.player.isMoving){
	instance_destroy();
}