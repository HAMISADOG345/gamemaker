/// @description Insert description here
// You can write your code in this editor

// @description Set Default Behaviors

// NOTE: DO NOT USE BUILT IN VARIABLES X, Y, or GRAVITY...

// The following set of varibles can be changed here by the developer or in other
// locations of the game to impact player behavior
varWalkingSpeed = 10		// sets the walking speed
varRunningSpeed = 10		// sets the running speed
varJumpingSpeed = 10     	// sets the jumping speed
varGravity = 0.4			// sets the gravity
varDrag = 0.3				// sets the drag - how fast a character slows
varRunningJumps = true		// set to false if you dont want runnning speed to be used in jumps
varDoubleJumps = false		// set to false if you dont want double jump
varAttacking = false		// used for attacking
varLook = 0					// determines which look the character starts with


//These variables are maintained by the step event
//very useful to reference in other places - the develop should never change these
varJumping = true			// always start the player in a jumping position to allow drop in alignment
varRunning = false
varHorizontalRide = false
varVerticalRide = false

//These variables are used by the step event only
//do not mess with these 
varVSpeed = 0
varHSpeed = 0
varJumps = 0

image_xscale = 2
image_yscale = 2

varHasJetPack = false











