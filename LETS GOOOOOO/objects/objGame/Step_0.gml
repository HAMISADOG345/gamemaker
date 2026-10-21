if varDeath = true {
	varDeath = false
	instance_destroy(objKai)
	if instance_exists(objCheckpointActive) {
		instance_create_layer(objCheckpointActive.x,objCheckpointActive.y+10,"riftLayer",objKai)
	} else {
		game_restart()
	}
	if instance_exists(objCheckpointActive) {
		repeat(10){
			var varExplosion = instance_create_layer(objCheckpointActive.x,objCheckpointActive.y,"checkpointLayer",objCheckpointParticle)
			varExplosion.direction = irandom_range(0,360)
			varExplosion.speed = irandom_range(1,10)
			varExplosion.image_angle = varExplosion.direction
		}
	} else {
		game_restart()
	}
}

if varHealth <= 0 and canDie {
	varDeath = true
}