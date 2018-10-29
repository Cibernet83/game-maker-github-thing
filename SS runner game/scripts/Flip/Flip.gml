///@desc 
///@param start
///@param times



start = argument0;
times = argument1;

flip = true;

sprite_index = spr_player_flip;
image_index = start;

var loop = 0;

while(loop <= times)
{
	draw_text(obj_player.x,obj_player.y+50,image_number)
	if(image_index == ((start + image_number-1) mod image_number-1)) loop++;
	loop += 0.1;
}

flip = false;
