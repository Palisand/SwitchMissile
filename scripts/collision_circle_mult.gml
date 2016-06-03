/// collision_circle_mult(x, y, rad, obj, prec, notme)

/* Returns an array of colliding object ids.
 * The first index holds the number of colliding objects.
 */

var xx = argument0;
var yy = argument1;
var rad = argument2;
var obj = argument3;
var prec = argument4;
var notme = argument5;

var colliders;
var index = 0;
colliders[0] = index;

with (obj) {
    // handle 'notme'
    if (notme && id == other.id) {
        continue;
    }
    if (collision_circle(xx, yy, rad, id, prec, false)) {
        // add to array
        colliders[0] = ++index;
        colliders[index] = id;
    }
}

return colliders
