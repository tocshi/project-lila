if(x <= mouse_x){
	draw_sprite_ext(spr_debug_player,-1,x,y,1,1,0,-1,alpha);
} else {
	draw_sprite_ext(spr_debug_player,-1,x,y,-1,1,0,-1,alpha);
}

if(keyboard_check(vk_alt) && ds_map_exists(global.itemData[| equips[0]],"atkrange")){
	var atkrange = ds_map_find_value(global.itemData[| equips[0]],"atkrange");
	draw_sprite_ext(spr_debug_direction,-1,x,y,(atkrange*2)/64,(atkrange*2)/64,point_direction(x,y,mouse_x,mouse_y)-45,-1,0.7);
}
