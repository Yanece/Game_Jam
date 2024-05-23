// Mouvement des soldats

verticalSpeed += grav;
horizontalSpeed = walkSpeed;

// Collision Horizontale

if (place_meeting(x + horizontalSpeed, y, oSolid))
{
	walkSpeed = walkSpeed*-1;
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

// Animation
/*if horizontalSpeed != 0
{
	sprite_index = sSoldiers;
	image_xscale = sign(horizontalSpeed);
}
else
{
	sprite_index = sSoldiers;
}*/

if (!place_meeting(x, y+1, oSolid))
{
	sprite_index = sSoldiers;
}
else
{
	if (horizontalSpeed == 0)
	{
		sprite_index = sSoldiers;
	}
	else
	{
		sprite_index = sSoldiers;
	}
}
if  horizontalSpeed != 0
{
	image_xscale = sign(horizontalSpeed);
}

// Interaction avec le joueur
if (place_meeting(x, y, oPlayer)) && (oPlayer.invincible == false)
{
	if (oPlayer.y < y-10)
	{
		with(oPlayer) verticalSpeed = -4;
		hp -=1;
	}

	else 
{
	if oPlayer.invincible == false
	{
		global.hp -= 1;
		oPlayer.invincible = true;
		oPlayer.alarm[0] = 30;
	}
}
}