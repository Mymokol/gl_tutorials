#version 430 core

uniform sampler2D u_textureSampler1;
uniform sampler2D u_textureSampler2;
uniform sampler2D u_alpha;

out vec4 out_fragColor;

in vec3 f_normal;
in vec2 f_texCoord;

void main() {
	vec4 intermediate = 0.5 * (texture(u_textureSampler1, f_texCoord) + texture(u_textureSampler2, f_texCoord));
	out_fragColor = vec4(vec3(intermediate), texture(u_alpha, f_texCoord).x);
}
