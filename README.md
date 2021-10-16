# Godot scene change

Hello! This is a demo project for screentone scene transition effect.
The shader code include on this project but give it a like one [Godot Shader](https://godotshaders.com/shader/screentone-scene-transition/) mean the world to me!

You can take a look at [this demo](https://vimeo.com/597176170)

For quick copy you can get it now right there!

```glsl
shader_type canvas_item;

uniform vec4 in_color:hint_color;
uniform vec4 out_color:hint_color;

uniform float in_out:hint_range(0.,1.)=0.;

uniform float position:hint_range(-1.5,1.) = 0.856;
uniform vec2 size = vec2(16., 16.);

void fragment(){
    vec2 a = (1./SCREEN_PIXEL_SIZE) / size;
    
    vec2 uv=UV;
    uv *= a;
    
    vec2 i_uv = floor(uv);
    vec2 f_uv = fract(uv);
    
    float wave = max(0.,i_uv.x/(a.x) - position);
    
    vec2 center = f_uv*2.-1.;
    float circle = length(center);
    circle = 1. - step(wave,circle);
    
    vec4 color = mix(in_color, out_color, step(0.5, in_out));
    
    COLOR=vec4(circle) * color;
}
```
### Variables explain:

**In Color** is the color of transition in effect

**Out Color** is the color of transition out effect

**In Out** set which color to pick, If the value greater than 0.5. The color will be Out color otherwise it will be the In color.

**Position** the a slide from -1.5 to 1 if it set to 1, whole screen will be reveal. If it -1.5, whole screen will be cover.

**Size** size of circles

----

😊 Feel free to use it in your project, credit if you want to. I'm not give this a licence because this contain some graphics stuffs that I only want to be use for education purposes
