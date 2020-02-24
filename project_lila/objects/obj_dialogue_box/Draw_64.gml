draw_sprite(gui_dialogue_box,0,x,y);
draw_set_font(fnt_gui_medium);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if(portrait_align_right){
	draw_sprite_ext(gui_portrait,0,x+dialogue_box_width,y,-1,1,0,0,1);
	draw_sprite(portrait_sprite,0,x,y+portrait_height);
	draw_sprite_ext(gui_portrait,1,x+dialogue_box_width,y,-1,1,0,0,1);
	//Draw Name
}
else{
	draw_sprite(gui_portrait,0,x,y);
	draw_sprite(portrait_sprite,0,x,y+portrait_height);
	draw_sprite(gui_portrait,1,x,y);
	//Draw Name
}
draw_set_font(fnt_gui_small);
//Draw Text
