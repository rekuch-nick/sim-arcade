//scope: only called from world
var charge = false;

if(mouse_wheel_up()){
	action --;
	if(action < 0){
		action = ds_list_size(actions) - 1;
	}
}

if(mouse_wheel_down()){
	action ++;
	if(action >= ds_list_size(actions)){
		action = 0;
	}
}




if(mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) ){
	xDown = xMouse;
	yDown = yMouse;
}

if(mouse_check_button_released(mb_left)){
	
	var act = ds_list_find_value(actions, action);
	if(xDown == xMouse && yDown == yMouse && cash >= actionCost(act) ){
		
		if(act == acts.zoneR && canZone(xMouse, yMouse)){ zMap[xMouse, yMouse] = "R"; charge = true; }
		if(act == acts.zoneA && canZone(xMouse, yMouse)){ zMap[xMouse, yMouse] = "A"; charge = true; }
		if(act == acts.zoneC && canZone(xMouse, yMouse)){ zMap[xMouse, yMouse] = "C"; charge = true; }
		
		if(act == acts.dezone && canDezone(xMouse, yMouse)){ zMap[xMouse, yMouse] = ""; charge = true; }
		
		if(act == acts.wait && yMouse < 10){ charge = true; }
		
		
	}
	xDown = -1; yDown = -1;
	if(charge){
		cash -= actionCost(act);
	}
}



if(charge){
	endTurn();
}


