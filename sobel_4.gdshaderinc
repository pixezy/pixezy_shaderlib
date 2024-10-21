vec3 sobel4(vec2 uv, sampler2D _texture, vec2 pixel_size){
	    
    vec2 uv_up = uv + vec2(0.0, -pixel_size.y);
    vec2 uv_down = uv + vec2(0.0, pixel_size.y);
    vec2 uv_left = uv + vec2(-pixel_size.x, 0.0);
    vec2 uv_right = uv + vec2(pixel_size.x, 0.0);   
    
    vec3 color_up = texture(_texture, uv_up).rgb;
    vec3 color_down = texture(_texture, uv_down).rgb;
    vec3 color_left = texture(_texture, uv_left).rgb;
    vec3 color_right = texture(_texture, uv_right).rgb;
    
    vec3 gx = (color_right - color_left) * 2.0; 
    vec3 gy = (color_down - color_up) * 2.0;
    
    return sqrt(gx * gx + gy * gy); 
}
