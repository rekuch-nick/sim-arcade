if(firstFrame){
	if(text != ""){
		ySpeed = -4;
		fadeBelow20 = -.02;
		timeCD = 300;
	}
	
	
	firstFrame = false;	
}



x += xSpeed;
y += ySpeed;
ySpeed += grav;

timeCD --;
if(timeCD < 30 * 2){ image_alpha -= fadeBelow20; }
if(timeCD < 1){ remove = true; }




if(remove){
	instance_destroy();
}