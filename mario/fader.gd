extends ColorRect

func fade_out(time: float, callback, fade_color: Color = Color.BLACK):
	_fade(1.0, time, callback, fade_color)

func fade_in(time: float, callback, fade_color: Color = Color.BLACK):
	_fade(0.0, time, callback, fade_color)

func _fade(opacity: float, time: float, callback, fade_color: Color = Color.BLACK):
	color = fade_color
	modulate.a = 1.0 - opacity
	visible = true
	var tween := get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(modulate, opacity), time)
	if callback and callback is Callable:
		tween.tween_callback(callback)
	tween.play()
