#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Color
    //FragColor = texture(image, model_uv);
    //float timeTest = float((int(time) % 1000)) / 1000.0;
    //FragColor = vec4(vec3(timeTest), 1);
    FragColor = vec4(vec3(time / 10000.0), 1);
}
