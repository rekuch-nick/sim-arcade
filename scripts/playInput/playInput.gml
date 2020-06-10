//scope: only called from world
var charge = false;
var longWait = false;

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

if(keyboard_check_pressed(ord("W"))){ selectAction(acts.wait); }
if(keyboard_check_pressed(ord("R"))){ selectAction(acts.zoneR); }
if(keyboard_check_pressed(ord("C"))){ selectAction(acts.zoneC); }
if(keyboard_check_pressed(ord("A"))){ selectAction(acts.zoneA); }
if(keyboard_check_pressed(ord("X"))){ selectAction(acts.dezone); }



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
		
		if(act == acts.wait && yMouse < 10){ 
			if(keyboard_check(vk_shift)){ longWait = true; }
			charge = true; 
		}
		
		
	}
	xDown = -1; yDown = -1;
	if(charge){
		cash -= actionCost(act);
	}
}


if(keyboard_check_pressed(vk_space)){
	if(keyboard_check(vk_shift)){ longWait = true; }
	charge = true;
}

if(charge){
	var m = floor(month);
	endTurn();
	if(longWait){
		while(floor(month) == m){
			endTurn();
		}
	}
}


