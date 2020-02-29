portrait_sprite = spr_buff_TODO;
portrait_align_right = false;

dialogue_box_width = sprite_get_width(gui_dialogue_box);
dialogue_box_height = sprite_get_height(gui_dialogue_box);
portrait_width = sprite_get_width(gui_portrait);
portrait_height = sprite_get_height(gui_portrait);

namefont = fnt_dialogue_name;
textfont = fnt_dialogue_name;
namecolor = c_white;
textcolor = c_white;

page = 0;
name = "NPC Name";
text[0] = "What the fuck did you just fucking say about me, you little bitch? I'll have you know I graduated top of my class in the Navy Seals, and I've been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills. I am trained in gorilla warfare and I'm the top sniper in the entire US armed forces.";
text[1] = "You are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words. You think you can get away with saying that shit to me over the Internet? Think again, fucker.";
text[2] = "As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You're fucking dead, kid.";
text[3] = "I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that's just with my bare hands.";
text[4] = "Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.";
text[5] = "If only you could have known what unholy retribution your little \"clever\" comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn't, you didn't, and now you're paying the price, you goddamn idiot. I will shit fury all over you and you will drown in it."
text[6] = "You're fucking dead, kiddo.";

x = global.game_width/2 - dialogue_box_width/2;
y = global.game_height*0.98 - dialogue_box_height;
