image_xscale = 2
image_yscale = 2

if (!active && sprite_index != sprCheckpointActiveActivate && point_distance(x, y, objKai.x, objKai.y) < 50) {
    sprite_index = sprCheckpointActiveActivate
    image_index = 0
}

if (sprite_index == sprCheckpointActiveActivate) {
    if (image_index >= image_number - 1) {
        var oldCheckpoint = instance_find(objCheckpointActive, 0)
        if (oldCheckpoint != noone) {
            with (objCheckpoint) {
                if (x == oldCheckpoint.x && y == oldCheckpoint.y) {
                    sprite_index = sprCheckpointActiveDeactivate
                    image_index = 0
                    active = false
                    visible = true
                }
            }
            instance_destroy(oldCheckpoint)
        }

        instance_create_layer(x, y, "checkpointLayer", objCheckpointActive)
        active = true
        visible = false
        sprite_index = sprCheckpoint
    }
}

if (sprite_index == sprCheckpointActiveDeactivate) {
    if (image_index >= image_number - 1) {
        sprite_index = sprCheckpoint
    }
}





