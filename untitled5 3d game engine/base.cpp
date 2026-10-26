//
// Created by rowan on 10/21/2026.
//

#include "header/base.h"

#include "dependancies/gladsources/glad_gl_core_33/include/glad/gl.h"
#include "dependancies/glfw-3.3.2.bin.WIN32/glfw-3.3.2.bin.WIN32/include/GLFW/glfw3.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>

using namespace std;

struct RenderObject {
    GLuint vao;
    GLuint vbo;
    unsigned int vertexCount;
    float scale;
};

vector<RenderObject> g_RenderObjects;
GLuint shaderProgram;

GLFWwindow* window;
bool base::AT = false;
bool base::winColor = false;

const char* vertexShaderSource = "#version 330 core\n"
"layout (location = 0) in vec3 aPos;\n"
"uniform float scale;\n"
"void main()\n"
"{\n"
"   gl_Position = vec4(aPos.x * scale, aPos.y * scale, aPos.z * scale, 1.0);\n"
"}\n\0";

const char* fragmentShaderSource = "#version 330 core\n"
"out vec4 FragColor;\n"
"void main()\n"
"{\n"
"FragColor = vec4(0.0f, 0.0f, 0.0f, 1.0f);\n"
"}\n\0";

struct vert { float x, y, z; };

base::base() {

}

void base::loadModel(string model, float scaleF) {
    newInstance.push_back({model, scaleF});
}

void base::compileAndBufferModels() {
    GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
    glCompileShader(vertexShader);

    GLuint fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
    glCompileShader(fragmentShader);

    shaderProgram = glCreateProgram();
    glAttachShader(shaderProgram, vertexShader);
    glAttachShader(shaderProgram, fragmentShader);
    glLinkProgram(shaderProgram);
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);

    for (const auto& item : newInstance) {
        ifstream file(item.path);

        if (!file.is_open()) {
            cerr << "failed to open OBJ at: " << item.path << endl;
            continue;
        }

        vector<vert> tempVert;
        vector<float> flatVertices;
        string line;

        while (getline(file, line)) {
            if (line.empty()) continue;
            stringstream ss(line);
            string type;
            ss >> type;

            if (type != "v" && type != "f") continue;

            if (type == "v") {
                vert v;
                ss >> v.x >> v.y >> v.z;
                tempVert.push_back(v);
            }
            else if (type == "f") {
                string v1, v2, v3;
                ss >> v1 >> v2 >> v3;
                if (v1.empty() || v2.empty() || v3.empty()) continue;

                int idx1 = stoi(v1.substr(0, v1.find('/'))) - 1;
                int idx2 = stoi(v2.substr(0, v2.find('/'))) - 1;
                int idx3 = stoi(v3.substr(0, v3.find('/'))) - 1;

                flatVertices.push_back(tempVert[idx1].x);
                flatVertices.push_back(tempVert[idx1].y);
                flatVertices.push_back(tempVert[idx1].z);

                flatVertices.push_back(tempVert[idx2].x);
                flatVertices.push_back(tempVert[idx2].y);
                flatVertices.push_back(tempVert[idx2].z);

                flatVertices.push_back(tempVert[idx3].x);
                flatVertices.push_back(tempVert[idx3].y);
                flatVertices.push_back(tempVert[idx3].z);
            }
        }
        file.close();

        RenderObject obj;
        obj.vertexCount = flatVertices.size() / 3;
        obj.scale = item.scaleF;

        glGenVertexArrays(1, &obj.vao);
        glGenBuffers(1, &obj.vbo);

        glBindVertexArray(obj.vao);
        glBindBuffer(GL_ARRAY_BUFFER, obj.vbo);
        glBufferData(GL_ARRAY_BUFFER, flatVertices.size() * sizeof(float), flatVertices.data(), GL_STATIC_DRAW);

        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
        glEnableVertexAttribArray(0);

        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindVertexArray(0);

        g_RenderObjects.push_back(obj);
        cout << "ur OBJ has loaded at: " << item.path << " vert " << obj.vertexCount << endl;
    }
}

void base::startRenderLoop(float redF, float greenF, float blueF, float alphaF) {
    if (g_RenderObjects.empty()) {
        cout << "there is nothing to draw" << endl;
        cout << "why are you even using the tool?" << endl;
    }

    while (!glfwWindowShouldClose(window)) {
        glClearColor(redF, greenF, blueF, alphaF);
        glClear(GL_COLOR_BUFFER_BIT);

        glUseProgram(shaderProgram);
        GLint scaleLocation = glGetUniformLocation(shaderProgram, "scale");

        for (const auto& obj : g_RenderObjects) {
            glUniform1f(scaleLocation, obj.scale);
            glBindVertexArray(obj.vao);
            glDrawArrays(GL_TRIANGLES, 0, obj.vertexCount);
        }

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    for (const auto& obj : g_RenderObjects) {
        glDeleteVertexArrays(1, &obj.vao);
        glDeleteBuffers(1, &obj.vbo);
    }
    glDeleteProgram(shaderProgram);
}

void base::winBuild(int width, int height, string title, bool fullscreen, float redF, float greenF, float blueF, float alphaF) {
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    GLFWmonitor* primaryMonitor = glfwGetPrimaryMonitor();
    const GLFWvidmode* mode = glfwGetVideoMode(primaryMonitor);

    if (fullscreen) {
        window = glfwCreateWindow(mode->width, mode->height, title.c_str(), primaryMonitor, NULL);
    } else {
        window = glfwCreateWindow(width, height, title.c_str(), NULL, NULL);
    }

    if (window == NULL) {
        cout << "glfw cannot create window" << endl;
        glfwTerminate();
        return;
    }

    glfwMakeContextCurrent(window);
    gladLoadGL(glfwGetProcAddress);
    glViewport(0, 0, width, height);
    compileAndBufferModels();
    startRenderLoop(redF, greenF, blueF, alphaF);

    glfwDestroyWindow(window);
    glfwTerminate();
}


