image_xscale += 0.05;
image_yscale += 0.02;
image_alpha -= 1/50;
time--;
if(time <= 0){
	instance_destroy();
}