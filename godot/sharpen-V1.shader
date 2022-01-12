shader_type canvas_item;

// Originally Adapted from https://www.shadertoy.com/view/wsK3Wt
// Very simple sharpen shader

uniform float SHARPEN_FACTOR;

void fragment(){
    // Sharpen detection matrix [0,1,0],[1,-4,1],[0,1,0]
    vec4 up = texture (TEXTURE, UV+(vec2 (0, 1)));
    vec4 left = texture (TEXTURE, UV+(vec2 (-1, 0)));
    vec4 center = texture (TEXTURE, UV);
    vec4 right = texture (TEXTURE, UV+(vec2 (1, 0)));
    vec4 down = texture (TEXTURE, UV+(vec2 (0, -1)));

    // Detect edges and output to screen
    COLOR = (1.0 + 4.0*SHARPEN_FACTOR)*center-SHARPEN_FACTOR*(up + left + right + down);

}



