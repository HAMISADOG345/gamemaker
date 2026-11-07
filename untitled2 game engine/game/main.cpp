//
// Created by rowan on 10/18/2026.
//

#include "main.h"
#include "../core/instaGame.h"

int main() {
    instaGame game;
    game.createInstance("test", 100, 100,"images/panda.png");
    game.createInstance("test", 500, 200,"images/monk.png");
    game.winBuild();
    return 0;
}
