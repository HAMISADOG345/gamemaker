if place_meeting(x,y,objKai) {
	objGame.varHealth += 10
	if objGame.varHealth >= objGame.varMaxHealth {
		objGame.varHealth = objGame.varMaxHealth
	}
		repeat(10){
		  var varExplosion = instance_create_layer(x,y,"riftLayer",objHeartParticle)
		  varExplosion.direction = irandom_range(0,360)
		  varExplosion.speed = random_range(0.1,7)
		  varExplosion.image_angle = varExplosion.direction
		}
	instance_destroy(self)
}

if place_meeting(x,y,objWall) {
	y = other.bbox_top
	varVSpeed = 0
} else {
	varVSpeed += varGravity
	y+=varVSpeed
}

