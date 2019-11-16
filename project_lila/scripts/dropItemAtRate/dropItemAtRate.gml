var xx = argument0;
var yy = argument1;
var itemid = argument2;
var rate = argument3;

var roll = random_range(0,100);

if(roll < rate){
	var item = instance_create_layer(xx,yy,"Items",obj_item_drop);
	item.itemid = itemid;
}
return item;