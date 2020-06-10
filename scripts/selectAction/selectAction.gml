//scope: caled from world chain
var act = argument0;
var startAction = action;
var tries = 0;

while(ds_list_find_value(actions, action) != act && tries < 2){
	action ++;
	if(action >= ds_list_size(actions)){
		action = 0;
		tries ++;
	}
}

if(tries >= 2){
	action = startAction;
	
}