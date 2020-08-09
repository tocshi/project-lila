if(target == noone || x <= target.x){
	draw_sprite_ext(sprite_index,-1,x,y,1,1,0,image_blend,image_alpha);
} else {
	draw_sprite_ext(sprite_index,-1,x,y,-1,1,0,image_blend,image_alpha);
}