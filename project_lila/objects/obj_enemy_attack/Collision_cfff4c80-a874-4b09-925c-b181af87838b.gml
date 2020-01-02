if(hasBuff(other,"Invisible")){exit;}
if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);	
	dmgCalc(other.id);
}