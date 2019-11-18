x = global.player.x;
y = global.player.y;

image_alpha -= 0.01;
image_xscale += 0.05;
image_yscale += 0.05;
if(image_alpha <= 0){
	instance_destroy();
}