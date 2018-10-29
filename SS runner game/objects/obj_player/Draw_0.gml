/// @description 

if(stamina_cooldown) draw_set_color(c_maroon);
else draw_set_color(c_green);
draw_rectangle(x-20,bbox_top-10,x+20,bbox_top-15,false);
if(stamina_cooldown) draw_set_color(c_red);
else draw_set_color(c_lime);
if(stamina > 0)draw_rectangle(x-20,bbox_top-10,x-20+(stamina/max_stamina*40),bbox_top-15,false);


draw_text(x,y-75,down);

draw_self();