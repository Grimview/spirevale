/// @description Insert description here
// You can write your code in this editor
box_create(a_ui_frame2, x - padding_left, y - padding_top, x + padding_right, y + padding_bottom);

draw_sprite_ext(a_ico_woodcutting, 0, x, y, 1, 1, 0, c_yellow, 1);

draw_set_valign(fa_middle);

draw_text(x - 40, y, string(Player.woodcutting));

draw_set_valign(fa_top);