#include "engine/header/base.h"

int main() {
    base b;
    b.winColor = true;
    b.loadModel("C:/Users/rowan/OneDrive/Documentos/enemy3d/enemy3d.obj",0.15f);
    b.winBuild();
    return 0;
}