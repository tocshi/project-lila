if(x <= destX){
	draw_sprite_ext(spr_debug_player,-1,x,y,1,1,0,-1,1);
} else {
	draw_sprite_ext(spr_debug_player,-1,x,y,-1,1,0,-1,1);
}



draw_sprite_ext(spr_debug_direction,-1,x,y,1.5,1.5,point_direction(x,y,mouse_x,mouse_y)-45,-1,0.7);