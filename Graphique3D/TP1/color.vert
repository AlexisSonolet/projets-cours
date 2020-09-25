#version 330 core

uniform mat4 matrix;
layout(location = 0) in vec3 position;
layout(location = 1) in vec3 vertex_color;

out vec3 fragment_color;

void main() {
    fragment_color = vertex_color;
    gl_Position = matrix * vec4(position, 1);
}
