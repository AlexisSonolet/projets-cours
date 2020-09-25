#version 330 core
in vec3 fragment_color;

uniform vec3 color;
out vec4 outColor;

void main() {
    outColor = vec4(fragment_color + color, 1);
}
