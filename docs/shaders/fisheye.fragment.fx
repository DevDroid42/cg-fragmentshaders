#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    vec2 transformedUV = (model_uv - 0.5) * 2.0;
    float theta = atan(transformedUV.y, transformedUV.x);
    float radius = pow(distance(vec2(0,0), transformedUV), 1.5);
    transformedUV = vec2(radius * cos(theta), radius * sin(theta));
    transformedUV = (transformedUV + 1.0) / 2.0;
    // Color
    FragColor = texture(image, transformedUV);
}
