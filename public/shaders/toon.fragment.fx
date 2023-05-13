#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 color = texture(image, model_uv);
    for(int i = 0; i < 4; i++){
        color[i] = float(int(color[i] * 4.0)) / 4.0;
    }
    FragColor = color;
}
