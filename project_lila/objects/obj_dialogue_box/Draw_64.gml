draw_sprite(gui_dialogue_box,0,x,y);
draw_set_font(namefont);
draw_set_color(namecolor);

draw_set_valign(fa_bottom);
if(portrait_align_right){
	draw_sprite_ext(gui_portrait,0,x+dialogue_box_width,y,-1,1,0,c_white,1);
	draw_sprite(portrait_sprite,0,x+dialogue_box_width-portrait_width/2,y-portrait_height);
	draw_sprite_ext(gui_portrait,1,x+dialogue_box_width,y,-1,1,0,c_white,1);
	draw_set_halign(fa_right);
	draw_text(x+dialogue_box_width-portrait_width/2 - 5,y,name);
}
else{
	draw_sprite(gui_portrait,0,x,y);
	draw_sprite(portrait_sprite,0,x,y-portrait_height);
	draw_sprite(gui_portrait,1,x,y);
	draw_set_halign(fa_left);
	draw_text(x+portrait_width/2 + 5,y,name);
}
draw_set_font(textfont);
draw_set_color(textcolor);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_ext(x+dialogue_box_width*0.02,y+dialogue_box_height*0.05,text[page],dialogue_box_height/4.1,dialogue_box_width*0.97)
