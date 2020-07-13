event_inherited();
interactable = true;
name = "Sign";
portrait_sprite = spr_empty;
voice_sound = 0;

bubble = bubble_symbol.notice;

player = _value(single_call(fp_variable_global_get, "player"));
dialogue_box = _value(single_call(fp_instance_find, obj_dialogue_box, 0));
reset_dialogue_box = call(fp_event_user, dialogue_box, 0);
pause_dialogue_box = call(fp_variable_instance_set, dialogue_box, "dialogue_pause", true);
unpause_dialogue_box = call(fp_variable_instance_set, dialogue_box, "dialogue_pause", false);
delete_dialogue_buttons = call(destroy_buttons_by_type, "Dialogue");
end_dialogue = call(fp_variable_instance_set, dialogue_box, "last_page", true);
