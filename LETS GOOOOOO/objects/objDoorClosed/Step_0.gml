if objGame.varKeys = 0 {
	image_index = 0
} else if objGame.varKeys = 1 {
	image_index = 1
} else if objGame.varKeys = 2 {
	image_index = 2
} else if objGame.varKeys = 3 {
	image_index = 3
}

if place_meeting(x-1,y,objKai) {
	if objGame.varKeys < 3 {
	varBox = instance_create_depth(0,0,-9999,objDialogue)
	varBox.drawMessage = "you need 3 keys. " + string(objGame.varKeys) + "/3 keys collected, find the keys around the map"
	} else {
		var varDoor = instance_create_layer(x,y,"structureLayer",objDoorOpen)
		varDoor.image_xscale = image_xscale
		varDoor.image_yscale = image_yscale
		var overLay = instance_create_layer(x,y,"entityGlow",objDoorOpenOverLay)
		overLay.image_xscale = image_xscale
		overLay.image_yscale = image_yscale
		instance_destroy(self)
	}
}