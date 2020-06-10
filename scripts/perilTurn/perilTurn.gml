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
		
		if(moveType == "spread" && spawns > 0){
			if(irandom_range(0, 99) < spawnRate){
				while(tries < 10 && !okay){
					tries ++; okay = true;
					tx = xSpot + irandom_range(-1, 1);
					ty = ySpot + irandom_range(-1, 1);
				
					if(!onBoard(tx, ty)){ okay = false; continue; }
					if(isPerilAt(tx, ty)){ okay = false; continue; }
					
				}
				if(okay){
					spawns --;
					var s = instance_create_depth(tx * 60 + 30, ty * 60 + 30, -999, object_index);
					s.firstFrame = false;
					s.xSpot = tx; s.ySpot = ty;
					s.spawns = spawns;
				}
				
			}
		}
		
	
	
	
	
	}
	
	
	
	//apply damage
	var build = world.bMap[xSpot, ySpot];
	if(build != noone){
		build.hp -= bumpDamage;
	}
	
	if(closeDamage > 0){
		var m = 5;
		if(closeRange >= 2){ m += 4; }
		for(var i=1; i<m; i++){
			if(i == 1){ tx = xSpot - 1; ty = ySpot; }
			if(i == 2){ tx = xSpot; ty = ySpot - 1; }
			if(i == 3){ tx = xSpot + 1; ty = ySpot; }
			if(i == 4){ tx = xSpot; ty = ySpot + 1; }
			if(i == 5){ tx = xSpot + 1; ty = ySpot + 1; }
			if(i == 6){ tx = xSpot + 1; ty = ySpot - 1; }
			if(i == 7){ tx = xSpot - 1; ty = ySpot + 1; }
			if(i == 8){ tx = xSpot - 1; ty = ySpot - 1; }
			
			if(tx < 0 || ty < 0 || tx > 19 || ty > 9){ continue; }
			build = world.bMap[tx, ty];
			
			if(build != noone){ build.hp -= closeDamage; }
		}
	}
	
	turns --;
	if(turns < 1){ removeWhenStill = true; }
	
}