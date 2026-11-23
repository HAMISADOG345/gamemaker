if varDeath = true {
	varDeath = false
	instance_destroy(objKai)
	if instance_exists(objCheckpointActive) {
		instance_create_layer(objCheckpointActive.x,objCheckpointActive.y,"riftLayer",objKai)
		varHealth = 100
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

if canDie = false {
	varHealth+=1000
}
if room = rmLevel1bluestone {
	lvl1keys = true
} else {
	lvl1keys = false
	varKeys = 0
}
if bossTrigger and varDeath = true{
	if instance_exists(objRiftParent) {
		instance_destroy(objRiftParent)
	}
	if instance_exists(objEnemyParent) {
		instance_destroy(objEnemyParent)
	}
	varKeys = 3
	varSpawnBoss = true
}
if varSpawnBoss {
	varSpawnBoss = false
	if room = rmLevel1bluestone {
		instance_create_layer(objBossSpawner.x,objBossSpawner.y,"riftLayer",objBluestoneMonstrosity)
	}
}

