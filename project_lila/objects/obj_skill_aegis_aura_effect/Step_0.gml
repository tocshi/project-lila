time--;
image_xscale+=0.01;
image_yscale+=0.01;
x = user.x;
y = user.y;
if(time > 30){image_alpha-= 1/60;}
else{image_alpha+= 1/60;}
if(time <= 0){
	removeBuff(user,"Aegis Aura",true);
	//show_debug_message(string(user) + " " + string(ds_list_size(user.buff)));
	instance_destroy();
}