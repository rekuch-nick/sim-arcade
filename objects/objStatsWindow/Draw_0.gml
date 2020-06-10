draw_self();






var act = ds_list_find_value(world.actions, world.action);
draw_set_font(fntMedium);
draw_set_color(c_gray);
draw_text(10, y + 10, world.actString[act]);
var c = actionCost(act);
if(c > 0){
	draw_text(10, y + 30, "-" + string(c));
}
if(act == acts.zoneR){
	draw_text(10, y + 50, "Provide people and tax\nincome, consumes food.");
}
if(act == acts.zoneA){
	draw_text(10, y + 50, "Provide food.");
}
if(act == acts.zoneC){
	draw_text(10, y + 50, "Provide workers to fix\nbuildings.");
}






draw_set_color(c_aqua);
draw_text(800, y + 10, "Month: " + string(world.month) );
draw_set_color(c_yellow);
draw_text(800, y + 30, "Pop: " + string(world.people) );
draw_set_color(c_lime);
draw_text(800, y + 50, "Cash: " + string(world.cash) );
draw_set_color(c_orange);
draw_text(800, y + 70, "Food: " + string(world.food) );





if(world.xMouse == clamp(world.xMouse, 0, 19) && world.yMouse == clamp(world.yMouse, 0, 9)){
	draw_set_alpha(random_range(.15, .2));
	draw_set_color(c_gray);
	draw_rectangle(world.xMouse * 60, world.yMouse * 60, world.xMouse * 60 + 59, world.yMouse * 60 + 59, false);
	draw_set_alpha(1);
	
	
}
	