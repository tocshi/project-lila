time--;
image_xscale+=0.01;
image_yscale+=0.01;
x = user.x;
y = user.y;
if(time > 30){image_alpha-= 1/60;}
else{image_alpha+= 1/60;}
if(time <= 0){
	instance_destroy();
	removeBuff(user,"Aegis Aura",true);
}