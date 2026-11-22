if debug {
	repeat(20) {
		varBombSpray = instance_create_layer(x,y,"riftLayer",objBluestoneBomb) 
		varBombSpray.speed = irandom_range(10,30)
		varBombSpray.direction = direction + 90 - irandom_range(0,100)
		
		if varHSpeed >= 0 {
			varBombSpray.direction = direction + 90 + irandom_range(-20,-100)
		} else if varHSpeed <= 0{
			varBombSpray.direction = direction + 90 - irandom_range(-20,-100)
		}
	}
}