// Draw HP and MP bars and itembar
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_healthbar(20, 20, 420, 40, (statmap[? "hp"]/statmap[? "maxhp"])*100, c_black, c_red, c_red, 0, true, true);
draw_healthbar(20, 40, 420, 60, (statmap[? "mp"]/statmap[? "maxmp"])*100, c_black, c_blue, c_blue, 0, true, true);

draw_set_font(fnt_hpmp);
draw_set_color(c_white);
draw_text(220, 15, string(ceil(statmap[? "hp"])) + " / " + string(round(statmap[? "maxhp"])));
draw_text(220, 37, string(ceil(statmap[? "mp"])) + " / " + string(round(statmap[? "maxmp"])));

draw_sprite(gui_itembar,-1,0,0);

// Renders buff icons based on their time remaining
for(var i = 0; i < min(ds_list_size(visBuff),20); i++){
	var buff_array = ds_list_find_value(buff,i);
	var time = buff_array[0];
	var alpha = 1;
	if(buff_array[0] <= 5*room_speed){
		if(buff_array[0] <= 1*room_speed){
			alpha = 0.25 * sin(time + (pi/2)) + 0.75;
		}
		else{
			alpha = 0.25 * sin(0.3 * time + (pi/2)) + 0.75;
		}
	}

	draw_sprite_ext(buff_array[6], -1, global.buffBarBox[i,0], global.buffBarBox[i,1], 1, 1, 0, c_teal, alpha);
}

