var target = argument0;
target.cd[findArrayIndex(skills,"Dual Traps")+1] = (get_skill_data("Dual Traps","cd")*room_speed)-180;
set_skill_data("Dual Traps","sprmap",2);
exit;