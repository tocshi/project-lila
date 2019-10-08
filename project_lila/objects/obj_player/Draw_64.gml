// Draw HP and MP bars
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_healthbar(20, 20, 420, 40, (statmap[? "hp"]/statmap[? "maxhp"])*100, c_black, c_red, c_red, 0, true, true);
draw_healthbar(20, 40, 420, 60, (statmap[? "mp"]/statmap[? "maxmp"])*100, c_black, c_blue, c_blue, 0, true, true);

draw_set_font(fnt_hpmp);
draw_set_color(c_white);
draw_text(220, 15, string(round(statmap[? "hp"])) + " / " + string(round(statmap[? "maxhp"])));
draw_text(220, 37, string(round(statmap[? "mp"])) + " / " + string(round(statmap[? "maxmp"])));
