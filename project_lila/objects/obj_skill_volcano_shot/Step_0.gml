time++;
if(flying){
	x += xspd;
	y = sqr(0.2 * time - 20) - 400 + y0;
	image_angle = point_direction(xprevious,yprevious,x,y);
	exit;
}

if(fading){
	image_alpha-=0.02;
	if(image_alpha <= 0){instance_destroy();}
}