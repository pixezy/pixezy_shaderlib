float depth_proximity(float dist, vec3 vertex, sampler2D depthtex, vec2 screenuv, mat4 invproj) {
	float depth_tex = textureLod(depthtex, screenuv, 0.0).r;
	vec4 view_space = invproj * vec4(screenuv * 2.0 - 1.0, depth_tex, 1.0);
	view_space.xyz /= view_space.w;
	float depthlinear = -view_space.z;
	return clamp(1.0 - smoothstep(depthlinear + dist, depthlinear, -vertex.z), 0.0, 1.0);
}
float depth_linear(sampler2D depthtex, vec2 screenuv,mat4 invproj){
	float depth_tex = textureLod(depthtex,screenuv,0.0).r;
  	vec3 ndc = vec3(screenuv * 2.0 - 1.0, depth_tex);
	vec4 view_space = invproj * vec4(ndc, 1.0);
	view_space.xyz /= view_space.w;
	return -view_space.z;
}
float depth_proximity_z(float dist, float depthlinear, vec3 vertex) {
	return clamp(1.0 - smoothstep(depthlinear + dist, depthlinear, -vertex.z), 0.0, 1.0);
}
float depth_normalized_to_camera_planes(sampler2D depth_tex, vec2 uv, mat4 inv_proj, float near, float far) {	
	float raw_depth = texture(depth_tex, uv).r;
	vec3 ndc = vec3(uv * 2.0 - 1.0, raw_depth);
	vec4 view_pos = inv_proj * vec4(ndc, 1.0);
	view_pos.xyz /= view_pos.w;
	float dist_view = -view_pos.z;
	float depth_normalized = clamp((dist_view - near)/(far - near),0.0,1.0); 	
	return depth_normalized; 
}
vec3 depth_to_world(sampler2D depthtex,vec2 screenuv,mat4 invproj, mat4 inview){
	float depth_tex = textureLod(depthtex,screenuv,0.0).r;
	vec3 ndc = vec3(screenuv * 2.0 - 1.0, depth_tex);
	vec4 world = inview * invproj * vec4(ndc, 1.0);
	return world.xyz / world.w;
}
vec3 vec3toScreen(vec3 pos, mat4 view_mat, mat4 proj_mat) {
	vec4 clip_pos = proj_mat * view_mat * vec4(pos, 1.0);
	vec3 ndc_pos = clip_pos.xyz / clip_pos.w;
	return (ndc_pos + 1.0) * 0.5;
}
