// Draw LVL and XP
var prev_lvl_xp = 100*power(statmap[? "level"],1.3);
var next_lvl_xp = 100*power(statmap[? "level"]+1,1.3);
draw_healthbar(20, 20, 100, 100, ((statmap[? "xp"]-prev_lvl_xp)/(next_lvl_xp-prev_lvl_xp))*100, c_black, c_purple, c_fuchsia, 3, true, true);
draw_set_font(fnt_menutitle);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_text_outlined(20,40,c_black,c_white,statmap[? "level"]);

// Draw HP and MP bars
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_healthbar(120, 20, 520, 40, (statmap[? "hp"]/statmap[? "maxhp"])*100, c_black, c_red, c_red, 0, true, true);
//hp shield
draw_set_alpha(0.7);
draw_healthbar(120, 20, 520, 40, min(statmap[? "hpshield"]/statmap[? "maxhp"],1)*100, c_black, c_yellow, c_yellow, 0, false, false);
draw_set_alpha(1);
draw_healthbar(120, 40, 520, 60, (statmap[? "mp"]/statmap[? "maxmp"])*100, c_black, c_blue, c_blue, 0, true, true);

draw_set_font(fnt_hpmp);
draw_text(320, 15, string(ceil(statmap[? "hp"] + statmap[? "hpshield"])) + " / " + string(round(statmap[? "maxhp"])));
draw_text(320, 37, string(ceil(statmap[? "mp"])) + " / " + string(round(statmap[? "maxmp"])));

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
	// Draw unleash cooldown
	if(cd[0] > 0){
		draw_healthbar(100, 100, 379, 113, (cd[0]/(unleashGauge*room_speed))*100, c_gray, c_white, c_white, 0, true, false);
	}
	draw_sprite(spr_unleash_gauge,-1,100,100);
}

// Draw itembar
draw_sprite(gui_itembar,-1,0,0);
for(var i = 0; i < array_length_1d(itemBar); ++i){
	var xx = global.itemBarBox[i,0];
	var yy = global.itemBarBox[i,1];
	var itemid = itemBar[i];
	draw_sprite(asset_get_index(ds_map_find_value(global.itemData[| itemid],"sprite")),-1,xx,yy);
	
	
	if((ds_map_find_value(global.itemData[| itemid],"type") == "consumable"
	|| ds_map_find_value(global.itemData[| itemid],"type") == "key")
	//&& (global.playerItems[itemid] > 1 || global.playerItems[itemid] == 0)
	&& itemid > 0){
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_set_font(fnt_gui_small);
		draw_text_outlined(xx+63,yy+69,c_black,c_white,string(global.playerItems[itemid]));
					
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
	render_cooldown(xx,yy,itemcd[itemid],ds_map_find_value(global.itemData[| itemid],"activeCD") * room_speed);
}

// Draw skill and item cooldowns
// TODO: dynamically figure out how many skills player has
// and which skill icon to use instead of relying on this staticm sajfgbnkjsdfbgkjdsfbjgkbdsfkjgbktjergbnkjsgdfhbjksdfghbjkgfrdujh
for(i = 0; i < 10; ++i){

	draw_sprite_ext(skill_sprite,skill_icon_mapping[i],global.hpmpend+(i*80),20,1,1,0,c_white,1);
	
	render_cooldown(global.hpmpend+(i*80),20,cd[i+1],maxcd[i+1]);
}

// Renders buff icons based on their time remaining
for(var i = 0; i < min(ds_list_size(visBuff),20); ++i){
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