//
// Created by rowan on 10/21/2026.
//

#ifndef UNTITLED5_BASE_H
#define UNTITLED5_BASE_H

#include <iostream>
#include <vector>

using namespace std;

struct instanceList {
    string path;
    float scaleF;
};

class base {
private:
    vector<instanceList> newInstance;

    static void functionAT();
    void render(const string& path, vector<float>& outVert);
    void startRenderLoop(float redf, float greenf, float bluef, float alphaf);
    void compileAndBufferModels();
public:
    static bool AT;
    static bool winColor;

    base();
    void loadModel(string model, float scaleF);
    void winBuild(int width = 1000, int height = 800, string title = "in minecraft 1+1=2 and 2+2=3 but 5+5= /", bool isFullScreen = false, float redf = 1.0, float greenf = 1.0, float = 1.0, float alphaf = 1.0);
};

#endif //UNTITLED5_BASE_H
