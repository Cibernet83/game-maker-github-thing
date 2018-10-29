///@desc place_meeting_ext(x,y,obj,mask) 
///@arg x
///@arg y
///@arg obj
///@arg mask
var xpos = argument[0];
var ypos = argument[1];
var obj = argument[2];

if(!instance_exists(obj_ext_col)) instance_create_layer(xpos,ypos,"Player",obj_ext_col)
else with(obj_ext_col)
{
	x = xpos;
	y = ypos;
}



with(obj_ext_col)
{
	if(argument_count > 3)
	mask_index = argument[3];	
	else
	mask_index = spr_1px;
	
	return place_meeting(x,y,obj);
}