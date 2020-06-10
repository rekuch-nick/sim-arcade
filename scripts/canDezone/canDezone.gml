var a = argument0;
var b = argument1;

if(a < 0 || a > 19 || b < 0 || b > 9){ return false; }

if(world.zMap[a, b] == ""){ return false; }
if(world.bMap[a, b] != noone){ return false; }

return true;