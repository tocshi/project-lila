if(x <= mouse_x){
	draw_sprite_ext(spr_debug_player,-1,x,y,1,1,0,-1,alpha);
} else {
	draw_sprite_ext(spr_debug_player,-1,x,y,-1,1,0,-1,alpha);
}

draw_set_font(fnt_gui_small);
if(statmap[? "hpregen"] > 100){draw_text_color(x+20,y-40,"INF HP",c_red,c_red,c_red,c_red,0.7);}
if(statmap[? "mpregen"] > 100){draw_text_color(x+20,y-28,"INF MP",c_blue,c_blue,c_blue,c_blue,0.7);}

if(keyboard_check(vk_alt) && ds_map_exists(global.itemData[| equips[0]],"atkrange")){
	var atkrange = ds_map_find_value(global.itemData[| equips[0]],"atkrange");
	draw_sprite_ext(spr_debug_direction,-1,x,y,(atkrange*2)/64,(atkrange*2)/64,point_direction(x,y,mouse_x,mouse_y)-45,-1,0.7);
}
