image_xscale = 2
image_yscale = 2

if (!active && point_distance(x, y, objKai.x, objKai.y) < 50) {
   
    instance_create_layer(x, y, "checkpointLayer", objCheckpointActive);
    active = true;
    visible = false;
    
    if (instance_number(objCheckpointActive) > 1) {
        var oldCheckpoint = instance_find(objCheckpointActive, 0);
        if (oldCheckpoint != noone) {            
            with (objCheckpoint) {
                if (x == oldCheckpoint.x && y == oldCheckpoint.y) {
                    active = false;
                    visible = true;
                }
            }
            instance_destroy(oldCheckpoint);
        }
    }
}




