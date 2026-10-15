if varDeath = true {
	varDeath = false
	instance_destroy(objSmallPlayer)
	instance_create_layer(objCheckpointActive.x,objCheckpointActive.y,"riftLayer",objSmallPlayer)
	repeat(10){
		var varExplosion = instance_create_layer(objCheckpointActive.x,objCheckpointActive.y,"checkpointLayer",objCheckpointParticle)
		varExplosion.direction = irandom_range(0,360)
		varExplosion.speed = irandom_range(1,10)
		varExplosion.image_angle = varExplosion.direction
	}
}