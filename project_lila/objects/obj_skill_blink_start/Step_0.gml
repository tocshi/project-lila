image_angle += 1;
skill--;
if(skill <= 0){
	instance_destroy();
	if(user.cd[4] <= 0){user.cd[4] = user.maxcd[4];}
}
