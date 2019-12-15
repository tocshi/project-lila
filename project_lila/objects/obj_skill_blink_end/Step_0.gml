if(skill > 20){
	image_xscale+=0.2;
}
else{
	image_xscale-=0.1;
}
image_yscale = image_xscale;
skill--;
if(skill <= 0){instance_destroy();}
