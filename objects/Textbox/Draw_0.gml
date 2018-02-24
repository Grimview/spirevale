/// @description Background, Outline, Placeholder, and Message
#region Background
draw_set_colour(c_black);
draw_set_alpha(0.65);

draw_roundrect_ext(x, y - 12, x + width, y, 2, 2, false);
#endregion

#region Outline
draw_set_colour(c_white);
draw_set_alpha(0.35);

draw_roundrect_ext(x, y - 12, x + width, y, 2, 2, true);
#endregion

#region Placeholder
draw_set_valign(fa_bottom);
draw_set_alpha(placeholder_alpha);
draw_set_colour(merge_colour(c_white, c_white, placeholder_colour));

draw_text_transformed(placeholder_x, placeholder_y, placeholder, placeholder_scale, placeholder_scale, 0);
#endregion

#region Message
draw_set_colour(c_white);
draw_set_alpha(1);

if (!password) {
	if (message != "" || focused) {
		if (!blink) {
			draw_text_transformed(x + 2, y, message, 0.50, 0.50, 0);
		} else {
			draw_text_transformed(x + 2, y, message + "|", 0.50, 0.50, 0);
		}
	}
} else {
	if (message != "" || focused) {
		var pass = "";
			
		for (var i = 0; i < string_length(message); i++) {
			pass += "*";
		}
		
		if (!blink) {
			draw_text_transformed(x + 2, y, pass, 0.50, 0.50, 0);
		} else {
			draw_text_transformed(x + 2, y, pass + "|", 0.50, 0.50, 0);
		}
	}
}
#endregion

// Reset Vertical Alignment
draw_set_valign(fa_top);