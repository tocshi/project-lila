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
	if(is_undefined(buff_array)){break;}
	var time = buff_array[0];
	var alpha = 1;
	var xx = global.buffBarBox[i,0];
	var yy = global.buffBarBox[i,1];
	if(buff_array[0] <= 5*room_speed){
		if(buff_array[0] <= 1*room_speed){
			alpha = 0.3 * sin(time + (pi/2)) + 0.7;
		}
		else{
			alpha = 0.3 * sin(0.3 * time + (pi/2)) + 0.7;
		}
	}
	
	draw_sprite_ext(buff_array[7], -1, xx, yy, 1, 1, 0, c_white, alpha);
	if(buff_array[5] > 1){
		draw_set_halign(fa_left);
		draw_set_font(fnt_hpmp);
		draw_text_outlined(xx+34,yy,c_black,c_white,buff_array[5]);
	}
	
}

