image_alpha-=0.01;
image_xscale+=0.01;
image_yscale+=0.01;
y--;

if(image_alpha < 0){
	instance_destroy();
}
