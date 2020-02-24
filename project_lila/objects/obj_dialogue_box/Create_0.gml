portrait_sprite = spr_empty;
portrait_align_right = false;


dialogue_box_width = sprite_get_width(gui_dialogue_box);
dialogue_box_height = sprite_get_height(gui_dialogue_box);
portrait_width = sprite_get_width(gui_portrait);
portrait_height = sprite_get_height(gui_portrait);


x = global.game_width - dialogue_box_width;
y = global.game_height*0.98 - dialogue_box_height;
