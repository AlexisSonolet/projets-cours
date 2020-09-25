#version 330 core

uniform sampler2D diffuse_map;
in vec2 frag_tex_coords;
out vec4 FragColor;

void main() {
    FragColor = texture(diffuse_map, frag_tex_coords);
}
