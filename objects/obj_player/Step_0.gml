/// @description does player things, inherits physics

doll_input_jump(A_BUTTON_PRESSED, A_BUTTON);
doll_input_move(RIGHT_BUTTON, LEFT_BUTTON, X_BUTTON);

//Inherits physics and collision from doll.
event_inherited();

//update alert. TODO: once interactables are added add a thing that sets 'interact' to 'true'
alert = "";

if (interact)
{
	alert += "?";
}
