image_alpha -= 0.01;
if(image_alpha <= 0){
	instance_destroy();
}
image_xscale -= 0.01;
image_yscale -= 0.01;
//image_angle -= image_alpha*100;