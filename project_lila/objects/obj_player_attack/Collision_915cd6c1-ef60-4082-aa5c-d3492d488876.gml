if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);
	
	dmgCalc(other.id);
	
	/*
	if (other.canKnockback){
		hit_flinch(other, point_direction(sourceX,sourceY,other.x,other.y), flinch_amount);
	}*/
}

