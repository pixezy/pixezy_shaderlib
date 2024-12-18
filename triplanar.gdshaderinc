vec3 direction_mask_local(vec3 normal, float power) {
    vec3 n = abs(normal);
    n = pow(n, vec3(power));
    float mask = dot(n, vec3(1.0));
    n /= mask;
    return n;
}
// Assuming that normal and vertex are in local space (vertex function)
vec2 uv_from_triplanar_local(vec3 normal, vec3 lvex) {
    vec3 mv = -lvex;
    vec3 dmask = direction_mask_local(normal, 1.0);
    dmask = round(dmask);
    vec2 uv_mask = mix(mix(mv.xy, mv.xz, dmask.y), mv.yz, dmask.x);
    return uv_mask;
}