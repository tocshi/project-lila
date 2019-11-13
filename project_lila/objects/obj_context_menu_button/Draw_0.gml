

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_gui_small);

draw_set_color(c_gray)
draw_rectangle(x, y, x + width, y + height, false)

draw_set_color(c_black)
draw_rectangle(x, y, x + width, y + height, true)

draw_set_color(c_white);

draw_set_alpha(1);

draw_text_outlined(x + width/20, y, c_black, draw_get_color(), type);
