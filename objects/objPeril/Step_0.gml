



//firstFrame
if(xSpot == -1 || ySpot == -1){
	var tries = 0;
	var okay = false;
	
	if(placePoint == "edge"){
		while(tries < 100 && !okay){
			tries ++;
			okay = true;
			var a = irandom_range(0, 19);
			var b = irandom_range(0, 9);
			var r = irandom_range(1, 4);
			if(r == 1){ b = 0; }
			if(r == 2){ a = 19; }
			if(r == 3){ b = 9; }
			if(r == 4){ a = 0; }
			
			if(isPerilAt(a, b)){ okay = false; }
		}
		if(okay){ xSpot = a; ySpot = b;}
	}
	
	xSpawn = xSpot; ySpawn = ySpot;
	
	x = xSpot * 60 + 30;
	y = ySpot * 60 + 30;
	
	
	
	if(xSpot == -1 || ySpot == -1){ remove = true; }
} // end of first frame

if(remove){ instance_destroy(); return; }


var m = moveSpeed;
while(m > 0 && (x != xSpot * 60 + 30 || y != ySpot * 60 + 30)){
	if(m > 0 && x < xSpot * 60 + 30){ x ++; m --; }
	if(m > 0 && x > xSpot * 60 + 30){ x --; m --; }
	if(m > 0 && y < ySpot * 60 + 30){ y ++; m --; }
	if(m > 0 && y > ySpot * 60 + 30){ y --; m --; }
}

var yTemp = floor(y / 60);
depth = -2001 - (yTemp * 10);


