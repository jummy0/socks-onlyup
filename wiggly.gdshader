shader_type canvas_item;

uniform float wiggle_width = 150.0;
uniform float wiggle_speed = 5.0;
uniform float wiggle_magnitude = 4.0;

void vertex() {
	VERTEX.y += sin(TIME * wiggle_speed + VERTEX.x * wiggle_width) * wiggle_magnitude;
}
