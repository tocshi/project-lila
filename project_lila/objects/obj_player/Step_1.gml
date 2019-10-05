//REGENERATION
hp += hpregen;
if(highRegenThreshold >= 90){
	mp += mpregen*2;
} else {
	mp += mpregen;
}

//STAT CLAMPING
atkspeed = clamp(atkspeed,0.01,10);
movespeed = clamp(movespeed,0,30);
hp = clamp(hp,0,maxhp);
mp = clamp(mp,0,maxmp);

//TIMERS
for (var i = 0; i < array_length_1d(cd); i++){
	if(cd[i] > 0){cd[i]--;}
}

for (var i = 0; i < ds_list_size(buff); if(!buffRemoved){i++;}){
	buffRemoved = false;
	var buff_array = ds_list_find_value(buff,i);
	if(buff_array[0] > 0){
		buff_array[0]--;
		ds_list_replace(buff,i,buff_array);
		//debug
		var effect = instance_create_layer(x,y,"Instances",obj_debug_buff);
		effect.vspeed = -1;
	}
	if(buff_array[0] <= 0){
		script_execute(buff_array[3],self);
		ds_list_delete(buff,i);
		buffRemoved = true;
	}
}


//COUNTDOWN EVENTS
if (cd[0] == 1){canMove = true;}

