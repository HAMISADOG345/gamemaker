/// @description Control  Movement and Looks

// Version 3.0
// DO NOT CHANGE ANY CODE IN THIS EVENT UNLESS YOU KNOW WHAT YOU ARE DOING

// Note: the logic below implements all movement and gravity
// None of the logic uses the built-in gravity, vspeed, or hspeed
// By controlling it all ourselves, we get better control

// the variable varLook determines what the character currently looks like
// this can be used in a variety of ways, like:
// a set of sprites where the character is holding a weapon or other object
// a set of sprites with a different look

// set the sprites - varLook can be used to change the player's sprite set
// for example varLook = 0 is the default player empty handed
// you might use varLook = 1 for sprites holding a sword or simply a different look



if varLook = 0
{
	varSPRIdle = sprVGIdle  //this sprite's mask is used for non-attacking sprites
	varSPRWalking = sprVGRun
	varSPRRunning = sprVGRun
	varSPRJumpUp = sprVGJump
	varSPRJumpDown = sprVGJump
	
} 


// if not in attacking mode - take care of idle, walking, running, and jumping
if varHasJetPack = false
{
	// set the mask_index to the idle sprite
	// it is managed inside the NotAttacking so that the attack mask can be changed
	mask_index = varSPRIdle
	
	varRunning = false
	// if space bar pressed, then jump
	// if you want to use the up arrow instead of vk_space use vk_up or use both like this
	// if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up)
	if keyboard_check_pressed(vk_space)
	{
		// This block prevents jumping higher and higher
		// So it checks that the player is in contact with a block below before
		// allowing the jump
		if place_meeting(x + 0, y + 1, objWall)
		{
			varVSpeed = -varJumpingSpeed
			varJumping = true
			varJumps++  // should now be 1
		}
		else if varDoubleJumps and varJumps = 1 //allow one extra jump
		{
			varVSpeed = -varJumpingSpeed
			varJumping = true
			varJumps++ //show now be 2
		}
	}
	
	// if right arrow key down, then set HSpeed to the default Walking Speed
	// if shift pressed as well, then setup for Running Speed
	if keyboard_check(vk_right) or keyboard_check(ord("Z"))
	{
		varHSpeed = varWalkingSpeed
		//If you want jumps to be speed up by running, comment out or delete "and not varJumping"
		if keyboard_check(vk_shift) and ((not varJumping and not varRunningJumps) or varRunningJumps)
		{
			varHSpeed = varRunningSpeed
			varRunning = true
		}
	}

	// if left arrow key down, then set HSpeed to the negative value of Walking Speed
	if keyboard_check(vk_left) or keyboard_check(ord("X"))
	{
		// Reverse by making it negative
		varHSpeed = -varWalkingSpeed
		
		if keyboard_check(vk_shift) and ((not varJumping and not varRunningJumps) or varRunningJumps)
		{
			varHSpeed = -varRunningSpeed
			varRunning = true
		}
	}

	// Now that the vertical and horizontal speeds have been set above, adjust for gravity
	// Simply add the Gravity amount to the VSpeed
	varVSpeed += varGravity

	// This step multiplies by the Drag Factor to slowly bring 
	// the object to a nice smooth stop.  Higher Drag values
	// result in longer slow downs.
	varHSpeed = varHSpeed*varDrag

	// The purpose of this is to enhance the slowdown of drag. 
	// Once we get close to being 0 due to drag, then we just 
	// zero it out.  If slowing too much, then increase this
	// number
	
	if(abs(varHSpeed) < .2)
	{
		varHSpeed = 0
	}

	
	// Are we close to a wall collision?
	if place_meeting(x + varHSpeed, y, objWall)
	{
		var varCollide = false;
			
		while not varCollide
		{
			// SIGN returns 1 when the number is positive
			// SIGN returns -1 when the number is negative
			// This allows use to take steps of 1 to get right
			// up to the wall one pixel at a time
			if not place_meeting(x + sign(varHSpeed), y, objWall)
			{
				x += sign(varHSpeed)
			}
			else
			{
				varCollide = true
				varHSpeed = 0
			}
		}
	}
	
	x += varHSpeed
	
	// Horizontal Moving Wall Logic
	// Logic: if "standing" on a moving wall, adjust the player x position by 
	// adding the hspeed of the moving wall to it.
	// IF YOU DON'T WANT THE PLAYER TO RIDE, BUT TO FREE RUN, JUST COMMENT OUT THE NEXT PART
	varTMovingWall = collision_point(x,bbox_bottom+1,objWallHorizontalMoving, false, false)
	if varTMovingWall != noone 
	{
		varHorizontalRide = true
		x+=varTMovingWall.hspeed
	}
	else
	{
		varHorizontalRide = false
	}
	// end ride horizontal moving 
	
	// Manage the jumps, is there a block below?
	if place_meeting(x + 0, y + varVSpeed, objWall) 
	{
		var varCollide = false;
		varJumping = false;  // set varJumping to false - useful variable in outside places
		varJumps = 0  // reset to zero for double jumps
	
		while ((varCollide == false))
		{
		
			if not place_meeting(x + 0, y + sign(varVSpeed), objWall)
			{
				y += sign(varVSpeed)
			}
			else
			{
				varCollide = true
				varVSpeed = 0
			}
		}
	}
	
	y += varVSpeed
	
	// Vertical Moving Wall Logic
	// 
	// Logic: if "standing" on a moving wall, adjust the player y position by 
	// adding the vspeed of the moving wall to it.
	varTMovingWall = collision_point(x,bbox_bottom+1,objPlatformTurn, false, false)
	if varTMovingWall != noone 
	{
		varVerticalRide = true
		y+=varTMovingWall.vspeed
	}
	else
	{
		varVerticalRide = false
	}
	
	varTMovingWall = collision_point(x,bbox_bottom+1,objPlatform, false, false)
	if varTMovingWall != noone 
	{
		varVerticalRide = true
		y+=varTMovingWall.vspeed
	}
	else
	{
		varVerticalRide = false
	}

	// end of Vertical Moving Wall Logic


	// Set the Appropriate Sprite
	// Are we jumping?
	if varVSpeed != 0 
	{
		if varVSpeed < 0 
		{
			sprite_index = varSPRJumpUp
		}
		else
		{
			sprite_index = varSPRJumpDown
		}
		// Flip the sprite to face left or right
		if varHSpeed > 0
		{
			// make the current value of image_scale positive, if neg, then mulitple by -1
			if image_xscale < 0 image_xscale *= -1
		}
		else if varHSpeed < 0 // if positive, then flip sign, avoid 0
		{
			if image_xscale > 0	image_xscale *= -1
		}
		// if there are walking sounds effects, this stops the sound when idle
		// good place for a jump SFX
		//audio_stop_sound(sndKnightWalk);
	}
	else  // if not jumping, check moving left or right
	{
		// If Horizontal speed not 0, that means we are moving
		// Set the Walking Sprite
		if varHSpeed != 0
		{
			if sprite_index != varSPRWalking and not varRunning
			{
				sprite_index = varSPRWalking
				//image_speed = 1
				//image_index = 0
			}
			if sprite_index != varSPRRunning and varRunning
			{
				sprite_index = varSPRRunning
				//image_speed = 1
				//image_index = 0
			}
		
			// If there is a walking sound, this turns it on
			/*
			if not audio_is_playing(sndKnightWalk)
			{
				audio_play_sound(sndKnightWalk, 0, true);
			}
			*/
		
			// Flip the sprite to face left or right
			if varHSpeed > 0 
			{
				// make the current value of image_scale positive, if neg, then mulitple by -1
				if image_xscale < 0 image_xscale *= -1	
			}
			else if varHSpeed < 0  
			{
				if image_xscale > 0	image_xscale *= -1
			}
		}
		else
		{
			// check varJumping to make sure we are not at the apex of a jump aka vspeed = 0
			if sprite_index != varSPRIdle and not varJumping 
			{
				sprite_index = varSPRIdle
				//image_speed = 1
				image_index = 0
			}
		
			// if there is a walking sound, this turns it off
			//audio_stop_sound(sndKnightWalk);
		}
	}
}
else if varHasJetPack = true// This is flying
{
	
}

move_wrap(true, true,0)