despawnCPParticle--

if despawnCPParticle < 0 {
	instance_destroy(self)
}

var varP = instance_create_layer(x,y,"riftLayer",objHitParticleParticle)
varP.direction = direction
varP.image_angle = image_angle