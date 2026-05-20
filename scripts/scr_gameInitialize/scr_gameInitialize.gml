/// @function game_initialize()
/// @description Sets up things right as the game starts. Sets random seed, initializes globals, font, then sends player to the title screen.
function game_initialize()
{
	randomise();
	draw_set_font(FONT_DEFAULT)
	globals_initialize();
	room_goto(ROOM_TITLE);
	show_debug_message("Game initialized.");
}