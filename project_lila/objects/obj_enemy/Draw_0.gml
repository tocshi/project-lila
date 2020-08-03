if(x >= xprevious){
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
} else {
	draw_sprite_ext(sprite_index,image_index,x,y,-1*image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
