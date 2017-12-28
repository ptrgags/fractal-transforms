#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform mat4 u_modelViewProjectionMatrix;
uniform vec2 u_resolution;

attribute vec4 a_position;
attribute vec2 a_texcoord;

varying vec3 v_pos;

void main() {
    vec3 pos = a_position.xyz;
    float r_squared = dot(pos, pos);
    pos /= r_squared;
    
    float blend_factor = 0.5 + 0.5 * sin(0.4 * u_time);
    pos = mix(a_position.xyz, pos, blend_factor);

    gl_Position = u_modelViewProjectionMatrix * vec4(pos, 1.0);
    v_pos = a_position.xyz;
}
