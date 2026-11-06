despawnCounter--

if despawnCounter < 0 {
	instance_create_layer(x,y,"riftLayer",objRiftClose)
	instance_destroy(self)
}

if despawnCounter > 10 and despawnCounter < 30 {
	var roll = random(100);
	if (roll < 20) {
		instance_create_layer(x+40, y+40, "riftLayer", objSpikedCube)
	} 
	else {
		instance_create_layer(x+40, y+40, "riftLayer", objSmartEnemy)
	}
}