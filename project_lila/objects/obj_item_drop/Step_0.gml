time++;
if(flying){
	x += xspd;
	y = sqr(0.3 * time - 12) - 144 + y0;
	image_angle+=12 * sign(xspd);
	exit;
}

if(fading){
	image_alpha-=0.02;
	if(image_alpha <= 0){instance_destroy();}
}
else{
	y = 4 * sin(0.05 * time) + y0;
}