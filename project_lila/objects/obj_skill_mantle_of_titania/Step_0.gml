if(user == 0){exit;}
x = user.x;
y = user.y;

if(skill >= 0){
	skill--;
	if(skill == 0){
		instance_destroy();
		exit;
	}
	if(skill > 47){
		image_angle-=170/7;
		image_alpha+=1/7;
		image_xscale+=0.7/7;
		image_yscale+=0.7/7;
	}
	else if(skill < 7){
		image_angle-=170/7;
		image_alpha-=1/7;
		image_xscale-=0.7/7;
		image_yscale-=0.7/7;
	}
	else{image_angle-=20/40;}
}
