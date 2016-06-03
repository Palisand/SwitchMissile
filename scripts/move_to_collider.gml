/// move_to_collider(collider)

var dist;
with (argument0) {
    dist = distance_to_point(other.x, other.y);
}
x += lengthdir_x(dist, direction);
y += lengthdir_y(dist, direction);
