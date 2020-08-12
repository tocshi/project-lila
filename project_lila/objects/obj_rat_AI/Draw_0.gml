if(x <= destX){
	draw_sprite_ext(sprite_index,-1,x,y,1,1,0,image_blend,image_alpha);
} else {
	draw_sprite_ext(sprite_index,-1,x,y,-1,1,0,image_blend,image_alpha);
}
//draw_text(x,y-64,atkTimer);