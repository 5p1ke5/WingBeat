/// @description Draws arms, body. Flickers if taken damage. 

//If the player has dashed, draws an afterimage effect
if (dashCD > 0)
{
	doll_draw((xprevious + x) / 2, (yprevious + y) / 2, c_blue, 0.2);
	doll_draw(xprevious, yprevious, c_blue, 0.1);
}

doll_draw();
