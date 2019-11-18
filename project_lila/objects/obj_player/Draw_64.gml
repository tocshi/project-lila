// Draw HP and MP bars
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_healthbar(20, 20, 420, 40, (statmap[? "hp"]/statmap[? "maxhp"])*100, c_black, c_red, c_red, 0, true, true);
draw_healthbar(20, 40, 420, 60, (statmap[? "mp"]/statmap[? "maxmp"])*100, c_black, c_blue, c_blue, 0, true, true);

draw_set_font(fnt_hpmp);
draw_set_color(c_white);
draw_text(220, 15, string(ceil(statmap[? "hp"])) + " / " + string(round(statmap[? "maxhp"])));
draw_text(220, 37, string(ceil(statmap[? "mp"])) + " / " + string(round(statmap[? "maxmp"])));

// Draw unleash gauge if unleashGauge > 0
if(unleashGauge > 0){
	if(essence > 2*unleashGauge){
	draw_healthbar(100, 100, 379, 113, (essence-unleashGauge*2)/unleashGauge*100, c_blue, c_fuchsia, c_fuchsia, 0, true, false);		
	}
	else if(essence > unleashGauge){
	draw_healthbar(100, 100, 379, 113, (essence-unleashGauge)/unleashGauge*100, c_lime, c_blue, c_blue, 0, true, false);		
	}
	else{
	draw_healthbar(100, 100, 379, 113, essence/unleashGauge*100, c_gray, c_lime, c_lime, 0, true, false);
	}
	draw_sprite(spr_unleash_gauge,-1,100,100);
}

// Draw itembar
draw_sprite(gui_itembar,-1,0,0);

// Draw skill and item cooldowns
for(i = 0; i < array_length_1d(skill_sprite); i++){

	draw_sprite(skill_sprite[i],0,global.hpmpend+(i*80),20);
	
	render_cooldown(global.hpmpend+(i*80),20,cd[i+1],maxcd[i+1]);
}

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

