/// @description Create text box
display = instance_create_layer(x + width, y - height, "dmgTxt", obj_textbox);
display.width = 300;
display.height = 300;
display.background_alpha = 0.3;
display.background_clr = c_black;
display.valign = fa_center;
display.x_round_radius = 10;
display.y_round_radius = 10;
