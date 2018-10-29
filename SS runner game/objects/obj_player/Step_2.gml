/// @description Animations

if(flip)
sprite_index = spr_player_flip

	
else if(vsp != 0)
{
	sprite_index = spr_player_airborne;
	if(vsp > 0) image_index = 1;
	else image_index = 0;
}
else if(crawl)
{
		sprite_index = spr_player_crawl;
		mask_index = spr_player_slide;
}
else if(slide)
	{
		sprite_index = spr_player_slide;
		mask_index = spr_player_slide;
	}
else 
{
	mask_index = spr_player_idle;
	if(hsp != 0)
		sprite_index = spr_player_running;
	else if(hanging)
		sprite_index = spr_player_hanging;
	else sprite_index = spr_player_idle;

}

if(dir != 0)
	image_xscale = dir;