//
// Created by rowan on 10/18/2026.
//

#include "instaGame.h"
#include <SFML/Graphics.hpp>
#include <iostream>
#include <string>
#include <vector>

using namespace sf;
using namespace std;

VideoMode fullscreen = VideoMode::getDesktopMode();
RenderWindow window;
Event event;
Texture texture;
Sprite sprite;

instaGame::instaGame() {

}

void instaGame::createInstance(string id, int x, int y, string imagePath) {
    newInstance.push_back({id, x, y, imagePath});
}

void instaGame::update() {

}

void instaGame::draw() {
    window.clear(Color::White);

    for (const auto& item : newInstance) {
        texture.loadFromFile(item.imagePath);
        sprite.setTexture(texture);
        sprite.setPosition(item.x, item.y);
        window.draw(sprite);
    }

    window.display();
}

void instaGame::winBuild(int Width, int Height, string winTitle, bool isFullScreen) {
    if (isFullScreen) {
        VideoMode fullScreen = VideoMode::getDesktopMode();
        window.create(fullScreen, winTitle, Style::Fullscreen);
    } else {
        window.create(VideoMode(Width, Height), winTitle);
    }

    cout << "window built!" << endl;

    while (window.isOpen()) {
        while (window.pollEvent(event)) {
            if (event.type == Event::Closed) {
                window.close();
            }
        }

        if (Keyboard::isKeyPressed(Keyboard::Escape)) {
            window.close();
        }

        update();
        draw();
    }
}
