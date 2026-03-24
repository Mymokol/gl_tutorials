#version 430 core

uniform vec4 u_solidColor1 = vec4(0.0, 0.0, 1.0, 1.0);
uniform vec4 u_solidColor2 = vec4(0.0, 1.0, 0.0, 1.0);
uniform vec4 u_solidColor3 = vec4(1.0, 0.0, 0.0, 1.0);


out vec4 out_fragColor;
in vec3 f_normal;

void main() {
    
	out_fragColor = (f_normal.x * 0.5 + 0.5) * u_solidColor1
    + (f_normal.y * 0.5 + 0.5) * u_solidColor2
    + (f_normal.z * 0.5 + 0.5) * u_solidColor3;
}

