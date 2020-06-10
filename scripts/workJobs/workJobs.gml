//scope : called form world
var n = argument0;
var tries = 0;
while(n > 0 && tries < 10000){
	tries ++;
	
	
	
	var a = irandom_range(0, 19);
	var b = irandom_range(0, 9);
	var build = bMap[a, b];
	
	if(build != noone){
		if(build.hp < build.mhp){
			if(irandom_range(0, 99) < 25){ build.hp ++; }
			n --;
		}
		
		
	}
	
	
	
	
	
}