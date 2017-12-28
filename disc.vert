#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform mat4 u_modelViewProjectionMatrix;
uniform vec2 u_resolution;

attribute vec4 a_position;
attribute vec2 a_texcoord;

varying vec3 v_pos;

#define PI 3.1415

void main() {
    vec3 pos = a_position.xyz;

    float theta = atan(pos.y, pos.x);
    float r = length(pos.xy);

    float x = sin(PI * r);
    float y = cos(PI * r);
    vec2 disc_pos = theta / PI * vec2(x, y);
    
    float blend_factor = 0.5 + 0.5 * sin(0.4 * u_time);
    pos = mix(a_position.xyz, vec3(disc_pos, 0.0), blend_factor);

    gl_Position = u_modelViewProjectionMatrix * vec4(pos, 1.0);
    v_pos = a_position.xyz;
}
