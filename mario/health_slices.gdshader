shader_type canvas_item;

uniform float wedges;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float modified_alpha = COLOR.a;
	if (COLOR.r < (8.0 - wedges) / 8.0 + 0.05){
		COLOR = vec4(0.0, 0.0, 0.0, modified_alpha / 2.0);
	} else {
		COLOR = vec4(1.0, 1.0, 1.0, modified_alpha);
	}
	
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
