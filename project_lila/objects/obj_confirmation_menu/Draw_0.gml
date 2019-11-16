draw_self()

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_dmgtxt);

draw_set_color(c_white);

draw_set_alpha(1);

draw_text_ext_transformed(x - width/2 + left_offset, y - height/2 + top_offset, text, 30, 450, 1, 1, 0);
reset_draw();
