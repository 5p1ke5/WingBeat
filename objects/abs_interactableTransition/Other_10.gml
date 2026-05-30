///@description When called check if locked. If not, transitions to the defined room.
if (feathers <= feather_number())
{
	transition_goto(roomTo, spawnX, spawnY);
}