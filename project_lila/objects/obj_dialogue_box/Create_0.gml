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
// pause for punctuation
pause = false;
// hard pause for actions
dialogue_pause = false;

page = 0;
name = "";
voice_sound = 0;
text = array_create(1,0);
speakers = array_create(1,0);
// scripts that execute before text starts rendering
pretext = array_create(1,0);
// scripts that execute after text has finished rendering
posttext = array_create(1,0);
posttext_triggered = false;

// I can't believe I deprecated something before I started using it
// turns out I already have a check in place for array so if your input 
// for pretext or posttext is empty then it just doesn't run any scripts
// fml I spent days planning this out LOLOL

// Oh boy here we go with one of my out-of-the-world ideas
// that probably isn't the best way to do this but here's a rundown of what it does
//
// 0 = Don't execute scripts. Useful if your dialogue doesn't require branching, camera
// movement, variable modification, etc. Saves a lot of code from running.
//
// 1 = Execute individual scripts at each pretext and posttext stage. Useful if your
// dialogue does simple tasks like branching, camera movement, variable modification, etc.
// 
// For complex cutscenes, create a single script that switches behaviour based on page number,
// and then create an array where all the default values are a single index array with the script name.
// This will execute the script at every pretext and posttext stage and switch behaviour as intended.
//script_execute_mode = 0;

x = global.game_width/2 - dialogue_box_width/2;
y = global.game_height*0.98 - dialogue_box_height;

alarm[0] = 2;
