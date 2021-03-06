/// @description 

//Key Checks

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
slide_release = keyboard_check_released(ord("S"))
run_check = keyboard_check(ord("D"));
run_release = keyboard_check_released(ord("D"));

key_dir = (right - left);

//event checks
can_hang = !place_meeting(x+(dir*5),y-20,obj_collision);
hanging = can_hang && !place_meeting(x,y+50,obj_collision);

roof_col = place_meeting(x,y-10,obj_collision);
floor_col = place_meeting(x,y+1,obj_collision);
in_ground = place_meeting(x,y,obj_collision);
wall_col = place_meeting(x+(dir*5),y,obj_collision);
low_roof = place_meeting_ext(x,bbox_bottom-35,obj_collision);
running = run_check && floor_col && !wall_col && !stamina_cooldown;
jump = ((y > obj_player.y || (wall_col && floor_col)) && !slide && !crawl && jump_cooldown == 0);

flip = false;
flip = false;


//dir = key_dir;
//Collisions

if(low_roof && floor_col && !slide) crawl = true;
else crawl = false;

if(crawl)
{
	slide = false;
	run_spd = base_run_spd/4;
}
else if(running && stamina > 0)
{
	run_spd = base_run_spd*2;
	stamina = max(stamina - 0.2, 0)
}
else run_spd = base_run_spd;

if(!running) stamina = min(stamina+0.025,max_stamina);

if(stamina <= 0) stamina_cooldown = true;
if(stamina >= max_stamina/100*20 && !run_check) stamina_cooldown = false; 

if((floor_col && !slide))can_slide = true;
//(slide) && unlock[UNLOCK.slide]
if(slide)
{
	if(slide_spd <= 0)
	{
		if(low_roof && floor_col)
		crawl = true;
		slide = false;
	}
	else
	{
		can_slide = false
		slide = true;
		slide_spd = max(slide_spd-0.1, 0);
		hsp = slide_spd * dir;
	}
}
else if(can_slide) slide_spd = run_spd;

if(slide && (slide_spd <= 0)) slide = false; 

if(y < obj_player.y && sprite_index = spr_player_hanging)
{
	x += 8*-dir;
}


if(floor_col)
	vsp = 0;
else if(roof_col)
	vsp = global.grv-grv_buffer*2;
else
	{
		vsp += global.grv-grv_buffer;
		if(!hanging)slide = false;
	}
	
if(place_meeting_ext(x+(dir*5),y,obj_collision,spr_player_slide))slide = false;
	
if(wall_col)
	{
		hsp = 0;
		if(jump && !floor_col)
		{
			if(can_hang) y -= (y mod 32);
			else
			{
				dir = -dir;	
				vsp = -jump_spd/2;
			}
		}
		
		if(vsp > 0) vsp = vsp/2;
			if(hanging) 
			{
				vsp = 0;
				y -= y mod 16;
				pre_hang = true;
			}
	}
else if(!slide)
	hsp = dir * run_spd;

if(jump)
{
	jump_cooldown = 20;
	if(jump_buffer != 0)
	{
		vsp = -jump_spd;
		//if(key_dir != 0)
		//dir = key_dir;
	}
}

if(floor_col || sprite_index = spr_player_hanging)
{
	jump_buffer = 8;	
}
jump_buffer = max(jump_buffer-1, 0);
jump_cooldown = max(jump_cooldown-1, 0);

if(in_ground)
	{
		y -= (y mod 32);
		x -= 4*dir;
	}

if(point_direction(x,y,obj_player.x,obj_player.y) >= 90 || point_direction(x,y,obj_player.x,obj_player.y) < 270) dir = 1;
else dir = -1;

//if() dir = -dir;
if(x >= obj_player.x-16 && x <= obj_player.x+16)hsp = 0;
x += hsp;
y += vsp;


