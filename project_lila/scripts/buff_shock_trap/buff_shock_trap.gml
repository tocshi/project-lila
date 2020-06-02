var target = argument0;
with(target){
	set_skill_cd("Dual Traps",(get_skill_data("Dual Traps","cd")*room_speed)-180);
}
set_skill_data("Dual Traps","sprmap",2);
exit;