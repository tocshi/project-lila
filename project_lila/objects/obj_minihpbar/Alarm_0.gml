var bar = instance_nearest(x,y,obj_minihpbar);
if(bar == noone || bar == self){exit;}
if(bar.target = self.target){
	instance_destroy(bar);
}
