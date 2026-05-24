/// @description inherits physics, senses collision.
event_inherited();

//Hitbox things. if we add objects that we need to check collision for (bullets, spikes, coins) it will go in the array.
var _collisions = hitbox_step();


//Here we will go through the collisions array. We will uncomment this once we have collisions.
/*
for (var _i = 0; _i < array_length(_collisions); _i++) 
{   
	var _collision = _collisions[_i];
	
}
*/

///Set sprite properties.
doll_animate();