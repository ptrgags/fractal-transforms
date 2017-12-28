uniform vec2 u_resolution;
uniform float u_time;

varying vec3 v_pos;

void main() {
    vec2 cell_uv = fract(v_pos.xy * 10.0);
    float dist = min(cell_uv.x, cell_uv.y);
    float grid = smoothstep(0.1, 0.2, dist);

    gl_FragColor = vec4(grid, 0.0, 0.0, 1.0);
}
