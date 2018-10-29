/// @description 

i = i * -1

if(place_meeting(x+(5*i),y,obj_player) && obj_player.slide) 
{
	with(instance_create_layer(x,y,layer,prt_flying_obj))
	{
		sprite_index = other.sprite_index;
		direction = (other.i*180)+190;
		i = other.i;
	}
	instance_destroy();
}

