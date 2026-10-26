MINOR

wait... who is writing the essay?

__________________________________________________________________________________________________________________________

untitled5 3d engine: a 3d engine built for OBJ that is so simple it can only display a static 3d model

here is some game code:

#include "engine/header/base.h"

int main() {
    base b;
    b.winColor = true;
    b.loadModel("C:/Users/rowan/OneDrive/Documentos/enemy3d/enemy3d.obj",0.15f);
    b.winBuild();
    return 0;
}

CMAKE REQUIRED + GLAD + GLFW + some other built in cpp libaries

should i put only texture shader and no geometry shader to make it gamemaker like?
