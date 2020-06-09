/// @param0 name
// TO BE CALLED ONLY FROM THE INSTANCE USING THE SKILL!

var skillname = argument0;
var time = argument1;

if(time == ""){time = get_skill_data(skillname,"cd")*room_speed;}

var matchArray = findAllArrayIndex(skills,skillname);
for(var i = 0; i < array_length_1d(matchArray); ++i){
	cd[matchArray[i]+1] = time;
}