time++;

if(trigger_interact){
	event_perform(ev_other,ev_user0);
	trigger_interact = false;
}
