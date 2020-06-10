

xMouse = floor(mouse_x / 60);
yMouse = floor(mouse_y / 60);

playInput();







//debug input
if(keyboard_check_pressed(ord("1"))){
	instance_create_depth(-60, -60, -2001, objTornado);
}