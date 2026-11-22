if objGame.varKeys < 3 {
	var closedDoor = instance_create_layer(x,y,"structureLayer",objDoorClosed)
	closedDoor.image_xscale = image_xscale
	closedDoor.image_yscale = image_yscale
	instance_destroy(objDoorOpenOverLay)
	instance_destroy(self)
}