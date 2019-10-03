// Draw HP and MP bars
draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_healthbar(20, 20, 420, 40, (hp/maxhp)*100, c_black, c_red, c_red, 0, true, true);
draw_healthbar(20, 40, 420, 60, (mp/maxmp)*100, c_black, c_blue, c_blue, 0, true, true);

draw_set_font(fnt_hpmp);
draw_set_color(c_white);
draw_text(220, 15, string(round(hp)) + " / " + string(round(maxhp)));
draw_text(220, 37, string(round(mp)) + " / " + string(round(maxmp)));
