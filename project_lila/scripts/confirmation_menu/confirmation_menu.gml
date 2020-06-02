x = camera_get_view_x(global.currentCamera) + camera_get_view_width(global.currentCamera)/2;
y = camera_get_view_y(global.currentCamera) + camera_get_view_height(global.currentCamera)/2;

var confirm_menu = instance_create_layer(x, y, "GUIPopUp", obj_confirmation_menu);
confirm_menu.text = argument2;
var btn_yes = instance_create_layer(x - confirm_menu.BTN_SEP, y + confirm_menu.BTN_DEPTH, "GUIPopUpButton", obj_generic_btn);

var btn_no = instance_create_layer(x + confirm_menu.BTN_SEP, y + confirm_menu.BTN_DEPTH, "GUIPopUpButton", obj_generic_btn);

btn_yes.type = "Confirmation";
btn_yes.function = argument0;
btn_yes.align = btn_yes.CENTRE;
btn_yes.width = 200;
btn_yes.height = 50;
btn_yes.halign = fa_center;
btn_yes.valign = fa_center;
btn_yes.left_offset = 0;
btn_yes.text = "Yes";
btn_yes.alarm[0] = 1;
btn_yes.sprite_index = spr_confirmation_button;

btn_no.type = "Confirmation";
btn_no.function = argument1;
btn_no.align = btn_no.CENTRE;
btn_no.width = 200;
btn_no.height = 50;
btn_no.halign = fa_center;
btn_no.valign = fa_center;
btn_no.left_offset = 0;
btn_no.text = "No";
btn_no.alarm[0] = 1;
btn_no.sprite_index = spr_confirmation_button;