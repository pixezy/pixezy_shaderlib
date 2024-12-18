float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
                      vec2(12.9898,78.233))) * 43758.5453123);
}

float random_animation(vec2 uv, float time) {
    float n = 0.0;
    n += fract(sin(dot(uv.xy + vec2(time), vec2(1.27, 3.71))) * 4375.0) * 0.5;
    n += fract(sin(dot(uv.xy * 2.0 + vec2(time), vec2(2.13, 7.89))) * 4375.0) * 0.25;
    n += fract(sin(dot(uv.xy * 4.0 + vec2(time), vec2(5.73, 1.41))) * 4375.0) * 0.125;
    return n;
}