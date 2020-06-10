for(var a=0; a<20; a++){
	for(var b=0; b<10; b++){
		
		if(world.zMap[a, b] != "" && world.bMap[a, b] == noone){
			draw_set_font(fntZone);
			var c = world.zMap[a, b];
			if(c == "A"){ draw_set_color(c_olive); }
			if(c == "R"){ draw_set_color(c_lime); }
			if(c == "I"){ draw_set_color(c_yellow); }
			if(c == "C"){ draw_set_color(c_aqua); }
			draw_text(a * 60 + 6, b * 60 + 6, c);
		}
		
	}
}
