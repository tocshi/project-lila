var target = argument0;
target.cd[findArrayIndex(skills,"Protective Footwork")+1] = get_skill_data("Protective Footwork","cd")*room_speed;
set_skill_data("Protective Footwork","sprmap",6);
exit;