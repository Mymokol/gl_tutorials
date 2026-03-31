#version 430 core

const vec3 u_lightPosition = vec3(15.0, 20.0, -10.0);

out vec4 out_fragColor;

in vec3 f_position;
in vec2 f_texCoord;

vec3 interpolateColour(float mint, float maxt, float t, vec3 C1, vec3 C2){
	float norm_t = (t - mint) / (maxt - mint);
	return (1-norm_t) * C1 + norm_t * C2;
//	return vec3(norm_t);
}

vec3 calculateColour(float height){
	if (height <= -.2) return vec3(.04, .14, .17);
	if (height <= .1) return interpolateColour(-.2, .1, height, vec3(.33, .68, .29), vec3(.47, .57, .45));
	return interpolateColour(.1, .2, height, vec3(.47, .57, .45), vec3(1, 1, 1));
}

void main() {
	vec3 lightDir = normalize(u_lightPosition - f_position);
	vec3 normal = normalize(cross(dFdx(f_position), dFdy(f_position)));
	float lambertian = max(dot(lightDir, normal), 0.0);
//	out_fragColor = vec4(vec3(0.0, 1.0, 0.0) * lambertian, 1.0);
	out_fragColor = vec4(calculateColour(f_position.y) * lambertian, 1.0);
}

