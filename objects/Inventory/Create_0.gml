/// @description Insert description here
// You can write your code in this editor
enum item {
	none = 0,
	water = 1
}

width = 3;
height = 3;

slots = ds_grid_create(width, height);
count = ds_grid_create(width, height);

ds_grid_clear(slots, item.none);
ds_grid_clear(count, 0);

ds_grid_set(slots, 0, 0, item.water);

show = false;

x = 128;
y = 128;