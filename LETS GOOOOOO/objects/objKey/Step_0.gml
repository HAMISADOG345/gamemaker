if place_meeting(x,y,objKai) {
	objGame.varKeys++
	
		repeat(10){
		  var varExplosion = instance_create_layer(x,y,"riftLayer",objBlueParticle)
		  varExplosion.direction = irandom_range(0,360)
		  varExplosion.speed = random_range(0.1,7)
		  varExplosion.image_angle = varExplosion.direction
		}
	instance_destroy(self)
}

if place_meeting(x,y,objWall) {
	y = other.bbox_top-32
	varVSpeed = 0
	varGravity = 0
} else {
	varVSpeed += varGravity
	y+=varVSpeed
}

