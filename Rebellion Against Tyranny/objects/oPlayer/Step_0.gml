// Controles du personnage (Récuperation des touches du clavier)

var press_right = keyboard_check(vk_right);
var press_left = keyboard_check(vk_left);
var press_jump = keyboard_check_pressed(vk_up);
var press_attack = keyboard_check_pressed(vk_space);

//Mouvements du personnage

var move = press_right - press_left;
horizontalSpeed = move *  walkSpeed;

if(isGrounded){
	verticalSpeed = -(press_jump * 8);
	isGrounded = false;
}else{
	verticalSpeed += grav;
	if(verticalSpeed > 10)
	{
		verticalSpeed = 10;
	}
}

// Animation
if horizontalSpeed != 0
{
	sprite_index = sPlayer_run;
	image_xscale = sign(horizontalSpeed);
}
else
{
	sprite_index = sPlayer_idle;
}

// Collision Horizontale

if (place_meeting(x + horizontalSpeed, y, oSolid))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, oSolid))
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}

x += round(horizontalSpeed);

// Collision Verticale

if (place_meeting(x, y + verticalSpeed, oSolid))
{
	while (!place_meeting(x, y + sign(verticalSpeed), oSolid))
	{
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
	isGrounded = true;
}

y += (verticalSpeed);

// Collision Enemy

if (place_meeting(x, y + 0.5, oSoldier))
{
	verticalSpeed = -4;	
}
