/// @description Insert description here
// You can write your code in this editor
var cam = view_camera[0];
var camX = camera_get_view_x(cam);
var camY = camera_get_view_y(cam);
var camW = camera_get_view_width(cam);
var camH = camera_get_view_height(cam);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// stats here
draw_set_font(fntStats)
draw_set_color(c_green)

draw_self()