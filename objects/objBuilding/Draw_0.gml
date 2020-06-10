draw_self();

//draw hpBar
if(hp < mhp){
	var frame = 1;
	if(hp < mhp * .6){ frame = 2; }
	if(hp < mhp * .3){ frame = 3; }
	
	var w = (hp / mhp) * 60;
	
	draw_sprite_stretched(imgHpBar, frame, x, y + 4, w, 4);
	
	
	
	
}