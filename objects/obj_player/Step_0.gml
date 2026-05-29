/// @description does player things, inherits physics

doll_input_jump(A_BUTTON_PRESSED, A_BUTTON);
doll_input_move(RIGHT_BUTTON, LEFT_BUTTON, X_BUTTON);
doll_input_dash(RIGHT_BUTTON_RELEASED, LEFT_BUTTON_RELEASED);
doll_input_interact(UP_BUTTON_RELEASED);
doll_input_pause(START_BUTTON_RELEASED);

//Inherits physics and collision from doll.
event_inherited();
