shader_type canvas_item;

uniform float vertical_period = 150.0;
uniform float vertical_period2 = 10.0;
uniform float vertical_speed = 1.0;
uniform float vertical_magnitude = 5.0;
uniform float horizontal_period = 0.0;
uniform float horizontal_period2 = 4.0;
uniform float horizontal_speed = 2.0;
uniform float horizontal_magnitude = 4.0;

void vertex() {
	float vx_old = VERTEX.x;
	float vy_old = VERTEX.y;
	VERTEX.y += sin(TIME * vertical_speed + vx_old * vertical_period + vy_old * vertical_period2) * vertical_magnitude;
	VERTEX.x += sin(TIME * horizontal_speed + vy_old * horizontal_period + vx_old * horizontal_period2) * horizontal_magnitude;
}
