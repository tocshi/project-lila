/// @description Insert description here
// You can write your code in this editor
CARET_DELAY = 10;
WIDTH = 1000;
HEIGHT = 400;
TEXT_HEIGHT = 20;
text = "";
active = false;
lines = ds_list_create();
caret = 0; // How far the caret is from the end
surface = 0;
is_caret = false;
alarm[0] = CARET_DELAY;