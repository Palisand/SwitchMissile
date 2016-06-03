/// spawn_crate(crate_obj)

var crate_obj = argument0;

var spawn;

do {
    spawn = instance_find(o_spawn_crate, irandom(instance_number(o_spawn_crate) - 1));
} until (!spawn.has_crate);
spawn.has_crate = true;
particle_burst(o_part_ctrl.type_missile_hit, 100, c_white, 360, spawn.x + spawn.sprite_width/2, spawn.y + spawn.sprite_height/2);
with (instance_create(spawn.x, spawn.y , crate_obj)) {
    spawn_id = spawn;
}
