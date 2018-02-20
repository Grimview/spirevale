/// @description Insert description here
// You can write your code in this editor
global.dt = delta_time / game_get_speed(gamespeed_microseconds)

camera = camera_create()

camWidth = 560;
camHeight = 350;

targetWidth = camWidth;
targetHeight = camHeight;

zoom = 0;

var vm = matrix_build_lookat(x, y, -1000, x, y, 0, 0, 1, 0)
var pm = matrix_build_projection_ortho(camWidth, camHeight, 1, 10000)

camera_set_view_mat(camera, vm)
camera_set_proj_mat(camera, pm)

view_camera[0] = camera

follow = Player
xTo = x
yTo = y

windowWidth = 1280;
windowHeight = 720;
window_set_size(windowWidth, windowHeight);

monitorWidth = display_get_width();
monitorHeight = display_get_height();
window_set_position(monitorWidth / 2 - windowWidth / 2, monitorHeight / 2 - windowHeight / 2);