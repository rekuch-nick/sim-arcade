

xMouse = floor(mouse_x / 60);
yMouse = floor(mouse_y / 60);

playInput();







//debug input
if(keyboard_check_pressed(vk_backspace)){
	food += 1000;
	cash += 1000;
}

if(keyboard_check_pressed(ord("1"))){
	instance_create_depth(-60, -60, -2001, objTornado);
}

if(keyboard_check_pressed(ord("2"))){
	instance_create_depth(-60, -60, -2001, objLightning);
}

if(keyboard_check_pressed(ord("3"))){
	instance_create_depth(-60, -60, -2001, objFire);
}

if(keyboard_check_pressed(ord("4"))){
	instance_create_depth(-60, -60, -2001, objLightning2);
}

if(keyboard_check_pressed(ord("5"))){
	instance_create_depth(-60, -60, -2001, objToxicSpill);
}