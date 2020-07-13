/// @description Interaction
// this is the default interaction sequence. Please override this if you plan on making anything more complex
with(instance_create_layer(0,0,"GUI",obj_dialogue_box)){
	name = other.name;
	if(other.portrait_sprite == spr_empty){portrait_enable = false;}
	else {portrait_sprite = other.portrait_sprite;}
	text = other.text;
	voice_sound = other.voice_sound;
	speakers = other.speakers;
	pretext = other.pretext;
	posttext = other.posttext;
}
