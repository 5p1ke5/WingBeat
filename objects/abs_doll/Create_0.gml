/// @description Initializes variables, position at spawn.

hitbox_initialize([HURTBOX]);
phys_initialize(0.2, 0.2);
	
//Doll movement control things.
hDir = 0; //Horizontal movement direction.
facing = 1; //Direction facing. Should always be 1 or -1.
maxSpeed = MAX_SPEED; 
accel = 0.5;

dashCD = -1;
dashInputLCD = -1;
dashInputRCD = -1;
jumpHeight = JUMP_HEIGHT;
jumpOffset = 0.1; //This is applied to gravity to let the player jump higher while holding the jump button.

//Various variables dolls use to animate.
animSpeed = 0.2; //How fast the player animates normally
animSpeedRun = 0.5; //How fast the player animates while running
image_speed = animSpeed;

wingFrame = 0;