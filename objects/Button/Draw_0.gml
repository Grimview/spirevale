draw_set_colour(merge_colour(colourInactive, colourActive, colourMerge));
draw_set_alpha(0.65);

draw_roundrect_ext(x - width / 2, y - height / 2, x + width / 2, y + height / 2, 2, 2, false);

draw_set_colour(c_white);
draw_set_alpha(0.35);
draw_roundrect_ext(x - width / 2, y - height / 2, x + width / 2, y + height / 2, 2, 2, true);

draw_set_colour(c_black);
draw_set_alpha(0.65);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(x, y + 1, string_upper(text), 0.5, 0.5, image_angle);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_colour(c_white);
draw_set_alpha(1);