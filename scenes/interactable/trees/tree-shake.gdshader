shader_type canvas_item;

uniform float intensity = 1.0;
uniform float shake_speed = 20.0;

void vertex() {
	vec2 shake = vec2(0.0);
	if (VERTEX.y < 0.0){
		shake.x = cos( TIME * shake_speed + VERTEX.y ) * intensity;
	}
	
	VERTEX.xy += shake;
}
