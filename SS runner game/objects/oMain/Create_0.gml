/// @description 
Macros();
obj_player.jump_key = jump_key;

unlock[UNLOCK.sprint] = true;
unlock[UNLOCK.wall_jump] = true;
unlock[UNLOCK.slide] = true;

for(var i = 0; i < array_length_1d(unlock); i++)
{
	obj_player.unlock[i] = unlock[i];
}