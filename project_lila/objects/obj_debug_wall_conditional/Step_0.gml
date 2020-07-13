//temp conditional

if(global.player.equips[0] > 0){
	if(image_xscale >= 0){
		image_xscale-=open_speed;
		clamp(image_xscale,0,scale_max);
	}
}
else{
	if(image_xscale <= scale_max){
		image_xscale+=open_speed;
		clamp(image_xscale,0,scale_max);
	}
}