if(!instance_exists(user)){instance_destroy();}
else{
	x = user.x;
	y = user.y;
}
skill--;
if(skill <= 0){
	instance_destroy();
}