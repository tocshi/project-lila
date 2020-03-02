portrait_enable = true;
portrait_sprite = spr_empty;
portrait_align_right = false;

dialogue_box_width = sprite_get_width(gui_dialogue_box);
dialogue_box_height = sprite_get_height(gui_dialogue_box);
portrait_width = sprite_get_width(gui_portrait);
portrait_height = sprite_get_height(gui_portrait);

namefont = fnt_dialogue_name;
textfont = fnt_dialogue_name;
namecolor = c_white;
textcolor = c_white;
// increases char_counter once every <textspeed> frames
textspeed = 1;
time = 0;
char_counter = 0;
pause = false;

page = 0;
name = "";
voice_sound = 0;
text = array_create(1,0);
speakers = array_create(1,0);

x = global.game_width/2 - dialogue_box_width/2;
y = global.game_height*0.98 - dialogue_box_height;

alarm[0] = 2;
