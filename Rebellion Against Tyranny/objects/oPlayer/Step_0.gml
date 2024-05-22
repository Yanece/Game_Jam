// Controles du personnage (Récuperation des touches du clavier

var press_right = keyboard_check(vk_right);
var press_left = keyboard_check(vk_left);
var press_jump = keyboard_check(vk_up);
var press_attack = keyboard_check_pressed(vk_space);

//Mouvements du personnage

var move = press_right - press_left;
hspeed = move *  walkspeed;
vspeed = vspeed + grav;

if (place_meeting(x, y + 1, oMur) && press_jump)
{
	vspeed = -4;
}

// Animation
if hspeed != 0
{
	sprite_index = sPlayer_run;
	image_xscale = sign(hspeed);
}
else
{
	sprite_index = sPlayer;
}
