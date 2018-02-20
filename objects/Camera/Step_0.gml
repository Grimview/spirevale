/// @description Insert description here
// You can write your code in this editor
global.dt = delta_time / game_get_speed(gamespeed_microseconds)

x += (xTo - x) / 25 * global.dt
y += (yTo - y) / 25 * global.dt

x = clamp(x, 0 + (camWidth / 2), room_width - (camWidth / 2))
y = clamp(y, 0 + (camHeight / 2), room_height - (camHeight / 2))

if follow != noone {
	xTo = follow.x
	yTo = follow.y
}

var vm = matrix_build_lookat(x, y, -1000, x, y, 0, 0, 1, 0)
camera_set_view_mat(camera, vm)

if (mouse_wheel_down()) {
	if (targetWidth < 640) {
		targetWidth += 32;
		targetHeight += 18;
	}
} else if (mouse_wheel_up()) {
	if (targetWidth > 320) {
		targetWidth -= 32;
		targetHeight -= 18;
	}
}

if (camWidth != targetWidth || camHeight != targetHeight) {
	if (camWidth != targetWidth) {
		camWidth += (targetWidth - camWidth) / room_speed * 6 * global.dt;
	}
			
	if (camHeight != targetHeight) {
		camHeight += (targetHeight - camHeight) / room_speed * 6 * global.dt;
	}
	
	var pm = matrix_build_projection_ortho(camWidth, camHeight, 1, 10000)
	camera_set_proj_mat(camera, pm)
}