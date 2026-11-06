if point_distance(x,y,objKai.x,objKai.y) < 100 {
	instance_create_layer(x,y,"entityGlow",objRiftOpen)
	instance_destroy(self)
}