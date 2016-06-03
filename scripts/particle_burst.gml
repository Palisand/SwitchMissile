/// particle_burst(type, amount, color, direction, x, y);

var type = argument0;
var amount = argument1;
var color = argument2;
var dir = argument3;
var xx = argument4;
var yy = argument5;

// ensure default particle speed for type_missile_hit
if (type == o_part_ctrl.type_missile_hit) {
    part_type_speed(type, 0, 5, 0, 0);
}

var spread = 20;  // as argument if necessary
part_type_colour1(type, color);
if (dir == 360) {
    part_type_direction(type, 0, 360, 0, 0);
}
else {
    part_type_direction(type, dir - spread, dir + spread, 0, 0);
}
part_emitter_region(o_part_ctrl.system, o_part_ctrl.emitter, xx - 1, xx + 1, yy - 1, yy + 1, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(o_part_ctrl.system, o_part_ctrl.emitter, type, amount);
