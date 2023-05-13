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
    vec2 transformedUV = (model_uv - 0.5) * 2.0;
    float radius = distance(vec2(0,0), transformedUV);
    transformedUV += (sin(radius * 30.0 - (time/1000.0) * 5.0) + 0.5) / 60.0;
    transformedUV = (transformedUV + 1.0) / 2.0;
    FragColor = texture(image, transformedUV);
}
