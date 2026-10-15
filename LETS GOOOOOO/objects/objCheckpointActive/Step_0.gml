stopCPParticle--

if stopCPParticle < 0{

} else {
	repeat(10){
		  var varExplosion = instance_create_layer(x,y,"checkpointLayer",objCheckpointParticle)
		  varExplosion.direction = irandom_range(0,360)
		  varExplosion.speed = irandom_range(1,10)
		  varExplosion.image_angle = varExplosion.direction
		}
}