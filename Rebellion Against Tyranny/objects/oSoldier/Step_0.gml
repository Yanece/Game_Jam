// Mouvement des soldats

verticalSpeed += grav;

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

// Interaction avec le joueur
if place_meeting(x, y - 1, oPlayer)
{
	hp -=1;
}