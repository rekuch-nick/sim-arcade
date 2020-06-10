draw_self();

//draw hpBar
if(hp < mhp){
	var frame = 0;
	if(hp / mhp <= .66){ frame = 1; }
	if(hp / mhp <= .33){ frame = 2; }
	
	var w = (hp / mhp) * 60;
	
	draw_sprite_stretched(imgHpBar, frame, x, y + 4, w, 4);
	
	
	
	
}