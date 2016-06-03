/// shake_screen(amount, fade_rate)

var amount = argument0;
var fade_rate = argument1;

if (fade_rate <= 0) {
    fade_rate = global.default_screen_shake_fade_rate;
}

with (o_main_ctrl) {
    shaking = true;
    shake_amount = amount;
    shake_fade_rate = fade_rate;
}
