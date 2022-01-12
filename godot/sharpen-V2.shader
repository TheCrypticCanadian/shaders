shader_type canvas_item;

// Originally Adapted from: 
// https://www.shadertoy.com/view/wsK3Wt
// Very simple sharpen shader
// Used kernal size bits from:
// https://godotforums.org/discussion/21270/need-help-to-implement-box-blur

uniform float SHARPEN_FACTOR;
uniform float kernel_size = 1.0;

void fragment(){
    // Sharpen detection matrix [0,1,0],[1,-4,1],[0,1,0]
    float kernel_size_x = kernel_size * TEXTURE_PIXEL_SIZE.x;
    float kernel_size_y = kernel_size * TEXTURE_PIXEL_SIZE.y;

    vec4 up = texture (TEXTURE, (UV+vec2 (0, -kernel_size_y)) );
    vec4 left = texture (TEXTURE, (UV+vec2 (-kernel_size_x, 0)) );
    vec4 center = texture (TEXTURE, (UV) );
    vec4 right = texture (TEXTURE, (UV+vec2 (kernel_size_x, 0)) );
    vec4 down = texture (TEXTURE, (UV+vec2 (0, kernel_size_y)) );

    COLOR = (1.0 + 4.0*SHARPEN_FACTOR)*center-SHARPEN_FACTOR*(up + left + right + down);

}



