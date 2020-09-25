#version 330 core

// fragment position and normal of the fragment, in WORLD coordinates
// (you can also compute in VIEW coordinates, your choice! rename variables)
in vec3 w_position, w_normal;   // in world coodinates

// light position, in world coordinates
uniform vec3 light_position;

// material properties
uniform vec3 k_a, k_d, k_s;
uniform float s;

// world camera position
uniform vec3 w_camera_position;

out vec4 out_color;

void main() {
    vec3 n = normalize(w_normal);
    vec3 l_unormalized = light_position - w_position;
    vec3 l = normalize(l_unormalized);
    vec3 r = reflect(-l, n);
    vec3 v = normalize(w_camera_position - w_position);
    float distance_squared = dot(l_unormalized, l_unormalized);

    // compute Phong illumination
    float diffuse_coeff = max(dot(n, l), 0.0);
    vec3 diffuse = k_d * diffuse_coeff;

    float specular_coeff = pow(max(dot(r, v), 0.0), s);
    vec3 specular = k_s * specular_coeff;

    // Light intensity, should be a uniform variable
    const float intensity = 50;

    vec3 color = k_a + intensity * (diffuse + specular) / distance_squared;
    out_color = vec4(color, 1.0);
}
