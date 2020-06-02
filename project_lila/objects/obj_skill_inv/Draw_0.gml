// grey out skill if it isn't unlocked
if(has_skill_unlocked(name)){
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1);
}
else{
	//TODO: turn this into a shader!
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_gray,0.6);
}
// render skill key overlay
if(skill_key >= 0){
	draw_set_alpha(0.7);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_gui_medium);
	draw_set_color(c_white);
	draw_sprite(spr_skill_overlay,0,x,y);
	var keystring = "key_skill" + string(skill_key);
	var key = variable_global_get(keystring);
	switch(key){
		case vk_enter:
			key = "Enter";
			break;
		case vk_tab:
			key = "Tab";
			break;
		case vk_shift:
			key = "Shift";
			break;
		case vk_control:
			key = "Ctrl";
			break;
		case vk_space:
			key = "Space (Do not use for now!)";
			break;
		case 191:
			key = "/";
			break;
		default:
			key = chr(key);
	}
	draw_text(x+33,y,key);
	draw_set_alpha(1);
}
/*
if(global.inv_item_preview_lock == itemid){
	draw_rectangle_colour(x+1,y+1,x+sprite_width-1,y+sprite_height-1,c_white,c_aqua,c_blue,c_aqua,true);
	draw_rectangle_colour(x,y,x+sprite_width,y+sprite_height,c_white,c_aqua,c_blue,c_aqua,true);
}
*/