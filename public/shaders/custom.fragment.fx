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
    //we will chop up the image into segments
    float segmentCount = sin(time/3000.0) + 2.0 * 4.0 + sin(time/6123.0 + 2.0);
    float segmentAngle = (3.1415926538 * 2.0) / segmentCount;
    vec2 transformedUV = (model_uv - 0.5) * 2.0;
    transformedUV *= 2.1;
    float theta = atan(transformedUV.y, transformedUV.x) + sin(time/10000.0) * 3.14;
    float radius = distance(vec2(0,0), transformedUV);
    //this will give us the segment this coordinate is in
    float currentSegment = floor(theta/segmentAngle);
    //only ever sample inside the first segment. 
    theta = theta - currentSegment * segmentAngle;
    //this will mirror half the segment. when the theta becomes over half the segment size it will flip
    theta = min(theta, segmentAngle - theta);
    //transform back to cartesian space
    transformedUV = vec2(cos(theta), sin(theta)) * radius + 0.5;
    transformedUV *= vec2(sin(time/4000.0) * 0.7 + 1.0, cos(time/4000.0) * 0.7 + 1.0);
    // Color
    vec4 color = texture(image, transformedUV);
    
    for(int i = 0; i < 3; i++){
        color[i] *= (sin(float((int(currentSegment) + i) % 3) / 3.1415926538) + 1.0) / 2.0;
        color[i] = pow(color[i], 1.5);
        color[i] *= 3.0;
    }
    FragColor = color;
}
