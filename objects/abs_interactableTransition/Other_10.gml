///@description When called check if locked. If not, transitions to the defined room.
if (feathers <= global.feathers)
{
	transition_goto(roomTo, spawnX, spawnY);
}