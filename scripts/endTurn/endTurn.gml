//scope: only called from world -> playAct

month += .1;
jobs = 0;



perilTurn();



aStart = irandom_range(0, 19);
bStart = irandom_range(0, 9);
for(var aa=0; aa<20; aa++){
	for(var bb=0; bb<10; bb++){
		
		var a = aa + aStart;
		while(a >= 20){ a -= 20; }
		var b = bb + bStart;
		while(b >= 10){ b -= 10; }
		
		if(zMap[a, b] != "" && bMap[a, b] == noone){
			
			
			
			if(irandom_range(1, 10) < growLuck){
				growLuck = 0;
				var t = objHouse01;
				if(zMap[a, b] == "A"){ t = objFarm01; }
				if(zMap[a, b] == "C"){ t = objShop01; }
				
				if(t == objHouse01 && food < 1){ continue; }
				
				bMap[a, b] = instance_create_depth(a * 60, b * 60, -2000 - (b * 10), t);
				bMap[a, b].xSpot = a; bMap[a, b].ySpot = b;
				bMap[a, b].image_index = irandom_range(1, 3);
				
				
			} else {
				growLuck ++;
			}
			
			continue;
		}
		
		
		
		
		
		if(bMap[a, b] != noone){
			var build = bMap[a, b];
			
			if(bMap[a, b].hp < 1){
				instance_destroy(bMap[a, b]);
				bMap[a, b] = noone;
				continue;
			}
			
			if(build.isJob){
				jobs ++;
			}
			
			
			if(bMap[a, b].isHouse){
				
				// houses
				if(irandom_range(10, 20) < bMap[a, b].pass){
					var i = bMap[a, b].image_index;
					var hp = bMap[a, b].hp;
					
					
					var s = bMap[a, b].object_index;
					var hurt = bMap[a, b].hp < bMap[a, b].mhp;
					var t = s;
					if(s == objHouse01 && food > 0 && !hurt){ t = objHouse02; }
					if(s == objHouse02 && food > 0 && !hurt){ t = objHouse03; }
					if(s == objHouse03 && food > 0 && !hurt){ t = objHouse04; }
					
					if(s == objHouse04 && food < 1){ t = objHouse03; }
					if(s == objHouse03 && food < 1){ t = objHouse02; }
					if(s == objHouse02 && food < 1){ t = objHouse01; }
					if(s == objHouse01 && food < 1){ t = noone; }
					
					if(t == s){ continue; }
					
					instance_destroy(bMap[a, b]);
					if(t == noone){ 
						bMap[a, b] = noone;
						continue; 
					}
					
					bMap[a, b] = instance_create_depth(a * 60, b * 60, -2000 - (b * 10), t);
					bMap[a, b].xSpot = a; bMap[a, b].ySpot = b;
					bMap[a, b].image_index = i;
					bMap[a, b].hp = hp;
				
				} else {
					bMap[a, b].pass ++;	
				}
			
				continue;
			}
			
			// farms
			if(bMap[a, b].isFarm){
				
				
				if(bMap[a, b].pass >= irandom_range(4, 6)){
					var i = bMap[a, b].image_index;
					
					
					var s = bMap[a, b].object_index;
					var t = s;
					if(s == objFarm01){ t = objFarm02; }
					if(s == objFarm02){ t = objFarm03; }
					if(s == objFarm03){ t = objFarm04; }
					if(s == objFarm04){ t = objFarm05; }
					if(s == objFarm05){ 
						t = objFarm01; 
						var s = instance_create_depth(a * 60 + 20, b * 60 + 20, -9000, objEffect);
						s.text = "+" + string(10);
						s.textColor = c_orange;
						food += 10;
					}
					
					if(t == s){ continue; }
				
					instance_destroy(bMap[a, b]);
					bMap[a, b] = instance_create_depth(a * 60, b * 60, -2000 - (b * 10), t);
					bMap[a, b].xSpot = a; bMap[a, b].ySpot = b;
					bMap[a, b].image_index = i;
				
				} else {
					bMap[a, b].pass ++;
				}
			
				continue;
			}
		
			
			
			
		
		
		} // end of bMap[a, b] != noone
		
		
		
	}
}

workJobs(jobs);


var m = month;
while(m >= 1){ m --; }
if(m == 0){
	
	people = 0;
	
	for(var a=0; a<20; a++){
		for(var b=0; b<10; b++){
			if(bMap[a, b] != noone){
				if(bMap[a, b].income != 0){
					var s = instance_create_depth(a * 60 + 20, b * 60 + 20, -9000, objEffect);
					s.text = "$" + string(bMap[a, b].income);
					s.textColor = c_yellow;
					cash += bMap[a, b].income;
				}
				
				people += bMap[a, b].people;
			}
		}
	}
	
	food = max(0, food - people);
	
	
	
}
