
other.varHealth -= 1;
	repeat(10){
		  var varExplosion = instance_create_layer(x,y,"riftLayer",objHitParticle)
		  varExplosion.direction = irandom_range(0,360)
		  varExplosion.speed = random_range(2,7)
		  varExplosion.image_angle = varExplosion.direction
		}
		instance_destroy(self)