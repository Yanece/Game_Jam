// Controles du personnage (Récuperation des touches du clavier

var press_right = keyboard_check(vk_right);
var press_left = keyboard_check(vk_left);
var press_jump = keyboard_check_pressed(vk_up);
var press_attack = keyboard_check_pressed(vk_space);

//Mouvements du personnage

var move = press_right - press_left;
hspeed = move *  walkspeed;

if(isGrounded){
	verticalSpeed = -(press_jump * 6);
}else{
	verticalSpeed += grav;
}

vspeed = verticalSpeed;
show_debug_message($"vspeed after : {verticalSpeed}")

//if (place_meeting(x, y + 1, oGround) && press_jump)
//{
//	vspeed = -6;
//}

// Animation
if hspeed != 0
{
	sprite_index = sPlayer_run;
	image_xscale = sign(hspeed);
}
else
{
	sprite_index = sPlayer_idle;
}

// Collision Horizontale

if (place_meeting(x + hspeed, y, oSolid))
{
	while (!place_meeting(x + sign(hspeed), y, oSolid))
	{
		x += sign(hspeed);
	}
	hspeed = 0;
}

x += hspeed;

// Collision Verticale

if (place_meeting(x, y + vspeed, oSolid))
{
	while (!place_meeting(x, y + sign(vspeed), oSolid))
	{
		y += sign(vspeed);
	}
	vspeed = 0;
	isGrounded = true;
}else{
	isGrounded = false;
}

y += vspeed;

// Collision Enemy
/*if (place_meeting(x, y + 0.5, oEnemy))
{
	vspeed = -4;	
}
