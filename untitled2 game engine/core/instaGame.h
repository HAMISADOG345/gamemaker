//
// Created by rowan on 10/18/2026.
//

#ifndef UNTITLED2_INSTAGAME_H
#define UNTITLED2_INSTAGAME_H

#include <SFML/Graphics.hpp>
#include <string>

using namespace sf;
using namespace std;

struct instanceList {
    std::string id;
    int x;
    int y;
    std::string imagePath;
};

class instaGame {
private:
    std::vector<instanceList> newInstance;

public:
    instaGame();
    void createInstance(std::string id, int x, int y, std::string imagePath);
    void update();
    void draw();
    void winBuild(int Width = 1000, int Height = 800, string winTitle = "window", bool isFullScreen = false);
};


#endif //UNTITLED2_INSTAGAME_H
