/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_font(F_Name);
draw_text(x - (string_width(name) / 2), y - 42, name);
draw_set_font(-1);