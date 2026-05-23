///@function doll_initialize(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor)
///@description Initializes variables for a draw. 
///@param _faceIndex Subimage in the faces sprite to set face.
///@param _hairIndex Subimage in the hair sprite to set hair.
///@param _shirtIndex Subimage in the shirt sprite to set shirt.
///@param _pantsIndex Which pants sprite to use.
///@param _shoeIndex Subimage in the shoes sprite to set shoes to.
///@param _skinColor Color for the doll's body.
///@param _hairColor Color to make the doll's hair.
///@param _shirtColor Color to make the doll's shirt.
///@param _pantsColor Color to make the doll's pants.
///@param _shoeColor Color to make the doll's shoes.
function doll_initialize(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor)
{
	faceIndex = _faceIndex;
	hairIndex = _hairIndex;
	shirtIndex = _shirtIndex;
	pantsIndex = _pantsIndex;
	shoeIndex = _shoeIndex;
	skinColor = _skinColor;
	hairColor = _hairColor;
	shirtColor = _shirtColor;
	pantsColor = _pantsColor;
	shoeColor = _shoeColor;
	
	sprite_index = spr_doll;
	pantsSprites = 
	[ //I'll think of a better way to do this later
		asset_get_index("spr_dollPants" + string(pantsIndex)), 
		asset_get_index("spr_dollPants" + string(pantsIndex) + "Jump"), 
		asset_get_index("spr_dollPants" + string(pantsIndex) + "Run")
	];
	pantsSprite = pantsSprites[0]
	
	shoeSprites = 
	[ //I'll think of a better way to do this later
		asset_get_index("spr_dollShoes" + string(shoeIndex)), 
		asset_get_index("spr_dollShoes" + string(shoeIndex) + "Jump"), 
		asset_get_index("spr_dollShoes" + string(shoeIndex) + "Run")
	];
	shoeSprite = shoeSprites[0]
	
	shirtSprite = spr_dollShirt;
	faceSprite = spr_dollFace;
	hairSprite = spr_dollHair;
	armSpriteA = spr_armA;
	armSpriteB = spr_armB;
}

///@function doll_struct(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor)
///@description Creates a struct form of the doll component and returns it.
///@param _faceIndex Subimage in the faces sprite to set face.
///@param _hairIndex Subimage in the hair sprite to set hair.
///@param _shirtIndex Subimage in the shirt sprite to set shirt.
///@param _pantsIndex Which pants sprite to use.
///@param _shoeIndex Subimage in the shoes sprite to set shoes to.
///@param _skinColor Color for the doll's body.
///@param _hairColor Color to make the doll's hair.
///@param _shirtColor Color to make the doll's shirt.
///@param _pantsColor Color to make the doll's pants.
///@param _shoeColor Color to make the doll's shoes.
function doll_struct(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor) 
{
	var _struct = {};
	
	with (_struct)
	{
		doll_initialize(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor);
	}
	
	return _struct;
}


///@function doll_animate()
///@description Sets which sprites are used in the draw event depending on what the doll is doing.
function doll_animate()
{
	image_xscale = facing;

	if (grounded)
	{
		if (hDir == 0)
		{
			sprite_index = spr_doll;	
			pantsSprite =  pantsSprites[0];
			shoeSprite = shoeSprites[0];
		}
		else
		{
			sprite_index = spr_dollRun;	
			pantsSprite = pantsSprites[2];
			shoeSprite = shoeSprites[2];
		}
	}
	else
	{
		sprite_index = spr_dollJump;		
		pantsSprite = pantsSprites[1];
		shoeSprite = shoeSprites[1];
	}
	
	armSpriteA = spr_armA;
	armSpriteB = spr_armB;
}


/// @function doll_draw()
/// @description Draws the sprites associated with the doll.
/// @param _x X coordinate to draw at. Defaults to doll's x coordinate.
/// @param _y Y coordinate to draw at. Defaults to doll's y coordinate.
/// @param _color Color to draw everything as. If left blank will default to doll's normal looks.
function doll_draw(_x = x, _y = y, _color = noone)
{
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, skinColor, 1);
	draw_sprite_ext(faceSprite, faceIndex, _x, _y, image_xscale, image_yscale, image_angle, c_white, 1);
	draw_sprite_ext(hairSprite, hairIndex, _x, _y, image_xscale, image_yscale, image_angle, hairColor, 1);
	draw_sprite_ext(pantsSprite, image_index, _x, _y, image_xscale, image_yscale, image_angle, pantsColor, 1);
	draw_sprite_ext(shirtSprite, shirtIndex, _x, _y, image_xscale, image_yscale, image_angle, shirtColor, 1);
	draw_sprite_ext(shoeSprite, image_index, _x, _y, image_xscale, image_yscale, image_angle, shoeColor, 1);
}

//These function take input to issue commands to the doll. The function vets the commands, and if the conditions are met performs the action.

/// @function doll_input_jump(_jump, _jumpOffset)
/// @desc Makes the doll attempt to jump. Height can be varied with _jumpOffset
/// @param _jump If the doll should attempt to jump.
/// @param _jumpOffset if the doll should offset their jump to jump higher.
function doll_input_jump(_jump, _jumpOffset)
{	
	if (_jump) //Jumps
	{
		vsp = phys_force_add(vsp, -jumpHeight, TERMINAL_VELOCITY)
	} 

	//Offsets gravity to allow for jump cancelling
	if (_jumpOffset) 
	{
		vsp -= jumpOffset;
	}
}


/// @function doll_input_move(_right, _left, _run)
/// @descr Commands the doll to move left or right. _run raises the maximum speed by 50%.
/// @param _right Moves right.
/// @param _left Move left.
/// @param _run Raises the maximum speed that can be accelerated  to.
function doll_input_move(_right, _left, _run)
{
	image_speed = _run ? animSpeedRun : animSpeed;
	
	hDir = _right - _left;
	
	if (hDir != 0)
	{
		hsp = phys_force_add(hsp, accel * hDir, maxSpeed + (0.5 * maxSpeed * _run));
		facing = hDir;
	}
}






/// @function doll_input_dash(_rightReleased, _leftReleased)
/// @descr Decrements dash input cooldowns. If right or left bttton is released before cooldown expires, performs a dash.
/// @param _rightReleased right button released
/// @param _leftReleased left button released
function doll_input_dash(_rightReleased, _leftReleased)
{
	if (dashCD > 0)
	{	
		dashCD--;	
		return;	
	}
	
	//decrement timers
	if (dashInputRCD > 0) 
	{ 
		if (_rightReleased)
		{
			//dash
			hsp = DASH_SPEED;
			dashCD = DASH_CD;
		}
		dashInputRCD-- 
	}
	
	//decrement timers
	if (dashInputLCD > 0) 
	{ 
		if (_leftReleased)
		{
			//dash
			hsp = -DASH_SPEED;
			dashCD = DASH_CD;
		}
		dashInputLCD-- 
	}
	
	if (_rightReleased)
	{
		dashInputRCD = DASH_INPUT_CD;	
	}
	
	if (_leftReleased)
	{
		dashInputLCD = DASH_INPUT_CD;	
	}
}




