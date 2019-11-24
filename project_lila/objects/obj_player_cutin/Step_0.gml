if(time <= 0){instance_destroy();}

if(time > duration*0.8){
	speed = (width*0.56)/(duration*0.2);
}
else if(time > duration*0.2){
	speed = (width*0.08)/(duration*0.6);
}
else{
	speed = (width*0.56)/(duration*0.2);
}

time--;
