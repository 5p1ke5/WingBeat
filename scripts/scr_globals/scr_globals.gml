/// @function globals_initialize()
/// @description Initializes the game's global variabls.
function globals_initialize()
{
	global.money = 0;
	global.feathers = 0;
	global.moons = 0;
	global.orbs = 0;
	global.crystals = 0;
	
	//These may be moved to a file but for now reading from memory is fine.
	global.bgm = noone;
	global.spawnX = undefined;
	global.spawnY = undefined;
	global.spawnHsp = undefined;
	global.spawnVsp = undefined;