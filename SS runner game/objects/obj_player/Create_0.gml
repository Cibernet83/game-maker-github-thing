/// @description Key Defines
//jump_key = oMain.jump_key

//solid var defines
hsp = 0;
vsp = 0;
global.grv = 0.7;
dir = 1;
slide = false;
can_slide = true;
jump_buffer = 0;
run_spd = base_run_spd;

slide_spd = 0;

max_stamina = 5;
stamina = max_stamina;

enum UNLOCK
{
	sprint,
	wall_jump,
	slide
}