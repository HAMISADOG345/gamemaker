		  repeat(50) {
		  var varExplosion = instance_create_layer(x,y,"riftLayer",objBlueParticle)
		  varExplosion.direction = irandom_range(0,360)
		  varExplosion.speed = random_range(0.1,7)
		  varExplosion.image_angle = varExplosion.direction
		  }