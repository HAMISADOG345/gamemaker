/// @description Insert description here
// You can write your code in this editor

// @description Set Default Behaviors

// NOTE: DO NOT USE BUILT IN VARIABLES X, Y, or GRAVITY...

// The following set of varibles can be changed here by the developer or in other
// locations of the game to impact player behavior
varWalkingSpeed = irandom_range(5,9)		// sets the walking speed
varRunningSpeed = 10		// sets the running speed
varJumpingSpeed = irandom_range(5,10)     	// sets the jumping speed
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
vely = 0

image_xscale = irandom_range(1.5,2.5)
image_yscale = image_xscale

varWillSpawnNone = false
varWillSpawnHelmet = false

var armor = irandom_range(1,100)

if varWillSpawnNone or varWillSpawnHelmet {
	if varWillSpawnHelmet {
		instance_create_layer(x,y,"riftLayer",objSmartEnemyHelmet)
		instance_destroy(self)
	}
	if varWillSpawnNone {
		return
	}
} else {
	if armor <= 40 {
		if armor <= 40 and armor >= 25 {
			instance_create_layer(x,y,"riftLayer",objSmartEnemyHelmet)
			instance_destroy(self)
		} if armor >= 1 and armor<= 15 {
			return 
		} else {
			return
		}
	} else {
		return
	}
}

tutorial = false












