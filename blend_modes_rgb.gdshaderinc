vec3 blend_multiply(vec3 a, vec3 b) {
    return a * b;
}
vec3 blend_screen(vec3 a, vec3 b) {
    return 1.0 - (1.0 - a) * (1.0 - b);
}
vec3 blend_overlay(vec3 a, vec3 b) {
    return mix(2.0 * a * b, 1.0 - 2.0 * (1.0 - a) * (1.0 - b), step(0.5, a));
}
vec3 blend_add_(vec3 a, vec3 b) {
    return a + b;
}
vec3 blend_subtract(vec3 a, vec3 b) {
    return a - b;
}
vec3 blend_soft_light(vec3 a, vec3 b) {
    return mix(2.0 * a * b + a * a * (1.0 - 2.0 * b), sqrt(a) * (2.0 * b - 1.0) + 2.0 * a * (1.0 - b), step(0.5, b));
}
vec3 blend_hard_light(vec3 a, vec3 b) {
    return mix(2.0 * a * b, 1.0 - 2.0 * (1.0 - a) * (1.0 - b), step(0.5, b));
}
vec3 blend_difference(vec3 a, vec3 b) {
    return abs(a - b);
}
vec3 blend_exclusion(vec3 a, vec3 b) {
    return a + b - 2.0 * a * b;
}
vec3 blend_darken(vec3 a, vec3 b) {
    return min(a, b);
}
vec3 blend_lighten(vec3 a, vec3 b) {
    return max(a, b);
}
