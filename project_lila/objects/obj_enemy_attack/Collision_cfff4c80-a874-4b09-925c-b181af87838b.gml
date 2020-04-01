if(hasBuff(other,"Invisible")){exit;}
if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);	
	dmgCalc(other.id);
}

if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
	if(!atkmap[? "isPiercing"]){
		ds_map_destroy(atkmap);
		atkmap = -1;
		instance_destroy();
	}
}