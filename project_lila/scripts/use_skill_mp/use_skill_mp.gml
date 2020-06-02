/// @param0 name
// TO BE CALLED ONLY FROM THE INSTANCE USING THE SKILL!

var skillname = argument0;
var mp = argument1;

if(mp == ""){mp = get_skill_data(skillname,"mpcost");}
statmap[? "mp"] -= mp;