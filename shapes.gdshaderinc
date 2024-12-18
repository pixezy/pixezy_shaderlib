float rectangle(vec2 uv, float width, float height) {
    vec2 half_size = vec2(width, height) * 0.5;
    vec2 d = step(half_size, abs(uv - 0.5));
    return max(d.x, d.y);
}

float circle(vec2 uv, float diameter)
{
	float radius = diameter/2.0;
	return smoothstep(radius, radius, length(uv - vec2(0.5)));
}