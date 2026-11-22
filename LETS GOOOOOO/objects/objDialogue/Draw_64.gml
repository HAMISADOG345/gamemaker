draw_sprite_stretched(sprBox, 0, x, y, 1000, 200)

draw_set_font(fntPlayer)

var textOffSetX = 1000/2
var textOffSetY = y + 32

draw_set_colour(c_white)
draw_text(textOffSetX,y+200/2,drawMessage)
draw_text(60,textOffSetY+160,"press space to close")

if keyboard_check(vk_space) {
	instance_destroy(self)
}