with(objPeril){
	if(firstTurn){
		firstTurn = false;
	} else {
		
		//move, spread, whatever
		var tx = xSpot;
		var ty = ySpot;
		var tries = 0;
		var okay = false;
		
		if(moveType == "random"){
			while(tries < 10 && !okay){
				tries ++; okay = true;
				tx = xSpot + irandom_range(-1, 1);
				ty = ySpot + irandom_range(-1, 1);
				
				if(!onBoard(tx, ty)){ okay = false; continue; }
				if(isPerilAt(tx, ty)){ okay = false; continue; }
				if(stayNearSpawn){
					if(tx < xSpawn - 3 || tx > xSpawn + 3){ okay = false; continue; }
					if(ty < ySpawn - 2 || ty > ySpawn + 2){ okay = false; continue; }
				}
				
			}
			if(okay){
				xSpot = tx; ySpot = ty;
			}
			
		}
		
		
	
	
	
	
	}
	
	
	
	//apply damage
	var build = world.bMap[xSpot, ySpot];
	if(build != noone){
		build.hp -= bumpDamage;
	}
	
	
}