// returns one of the given elements based on weight
// give arrays in the form of [element,weight]

var total_weight = 0;

for(var i = 0; i < argument_count; ++i){
	if(!is_array(argument[i])){show_error("choose_by_rate() given non-array value.",true)}
	total_weight+=array_get(argument[i],1);
}

var roll = random(total_weight);

for(var i = 0; i < argument_count; ++i){
	roll-=array_get(argument[i],1);
	if(roll < 0){return array_get(argument[i],0);}
}