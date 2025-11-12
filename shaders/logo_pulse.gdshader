shader_type canvas_item;

uniform vec2 resolution = vec2(1920, 1080);
uniform vec3 color: source_color = vec3(0.1,0.4,0.7);
uniform float zoom: hint_range(0.1, 3.0, 0.01) = 2.0;
uniform float speed:hint_range(0.0, 10.0, 0.01) = 2.0;
uniform float contrast: hint_range(1.0, 50.0, 0.01) = 20.0;
uniform float alpha_threshold:hint_range(0.0, 1.0, 0.1) = 0.0;

void fragment() {
	vec2 uv = UV;// - 0.5;
	vec2 half_uv = UV - 0.5;
	vec4 c = texture(TEXTURE, uv);
	half_uv.x *= resolution.x / resolution.y;
	half_uv *= zoom;
	float time = TIME * speed;
	float r = length(half_uv);
	float wave = sin(r * 5.0  - time) * sin(0.2 * r);
	vec3 result = abs(1.0 / (wave * contrast))  * color;
	float avg = (c.r + c.g + c.b) / 3.0;
	vec4 newOne = vec4(result, avg <= alpha_threshold ? 0.0 : 1.0);
	COLOR = newOne; // (c * newOne)/ (c + newOne );
}