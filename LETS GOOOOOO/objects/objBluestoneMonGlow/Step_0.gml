if instance_exists(objBluestoneMonstrosity) {

x = objBluestoneMonstrosity.x
y = objBluestoneMonstrosity.y

image_xscale = objBluestoneMonstrosity.image_xscale
image_yscale = objBluestoneMonstrosity.image_yscale

image_index = objBluestoneMonstrosity.image_index;

if objBluestoneMonstrosity.varHSpeed < 0
{
	if image_xscale < 0 image_xscale *= -1	
}
else if objBluestoneMonstrosity.varHSpeed > 0 
{
	if image_xscale > 0	image_xscale *= -1
}

if objBluestoneMonstrosity.sprite_index = sprblustoneIdle {
	sprite_index = sprblustoneIdleGlow
}

if objBluestoneMonstrosity.sprite_index = sprblustoneWalk {
	sprite_index = sprblustoneWalkGlow
}

if objBluestoneMonstrosity.sprite_index = sprblustoneSummon {
	sprite_index = sprblustoneSummonGlow
}

if objBluestoneMonstrosity.sprite_index = sprbluestoneStomp {
	sprite_index = sprbluestoneStompGlow
}

if objBluestoneMonstrosity.sprite_index = sprbluestoneStomp {
	sprite_index = sprbluestoneStompGlow
}

} else {
	instance_destroy(self)
}