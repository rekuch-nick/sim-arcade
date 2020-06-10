//scope: called from world


for(var a=0; a<20; a++){
	for(var b=0; b<10; b++){
		fMap[a, b] = "";
	}
}

for(var a=0; a<20; a++){
	for(var b=0; b<10; b++){
		zMap[a, b] = "";
	}
}

for(var a=0; a<20; a++){
	for(var b=0; b<10; b++){
		bMap[a, b] = noone;
	}
}



for(var a=0; a<20; a++){
	for(var b=0; b<10; b++){
		var t = objFloorTileA;
		
		if(fMap[a, b] == ""){
			if(a % 2 == 0 && b % 2 == 0){ t = objFloorTileB; }
			if(a % 2 == 1 && b % 2 == 1){ t = objFloorTileB; }
		}
		
		
		
		
		fMap[a, b] = instance_create_depth(a * 60, b * 60, -1000, t);
		fMap[a, b].xSpot = a; fMap[a, b] = b;
		
	}
}

var a = 9; var b = 4;
bMap[a, b] = instance_create_depth(a * 60, b * 60, -2000 - (b * 10), objCastle);
bMap[a, b].xSpot = a; bMap[a, b].ySpot = b;