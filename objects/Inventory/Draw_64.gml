/// @description Insert description here
// You can write your code in this editor
if (show) {
	for (var slot_x = 0; slot_x < ds_grid_width(slots); slot_x += 1) {
		for (var slot_y = 0; slot_y < ds_grid_height(slots); slot_y += 1) {
			draw_rectangle(x + (slot_x * 32), y + (slot_y * 32), x + 32 + (slot_x * 32),
							y + 32 + (slot_y * 32), true);
			
			var current_item = ds_grid_get(slots, slot_x, slot_y);
			draw_sprite(A_Items, current_item, x + 16 + (slot_x * 32), y + 16 + (slot_y * 32));
		}
	}
}