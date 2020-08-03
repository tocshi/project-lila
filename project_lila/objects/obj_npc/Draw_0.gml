if(x > xprevious){
	draw_sprite_ext(sprite_index,-1,x,y,1,1,0,image_blend,image_alpha);
} else {
	draw_sprite_ext(sprite_index,-1,x,y,-1,1,0,image_blend,image_alpha);
}

if(bubble > -1){
	draw_sprite(spr_notif_bubble,bubble,x,(y-sprite_height)+(10*sin(time/20)));
}