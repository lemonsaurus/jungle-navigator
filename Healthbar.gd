extends TextureProgress
export (Gradient) var gradient

signal dead
signal health (value)


func update_health(val: float, interpolate: bool = true):
	var new_val = clamp(self.value + val, 0, 100)

	if new_val == 0:
		emit_signal("dead")

	if interpolate:
		$Tween.interpolate_property(
			self, "value",
			value, new_val, 3,
			Tween.TRANS_BACK, Tween.EASE_IN
		)
		$Tween.start()
	else:
		self.value = new_val

func _on_value_changed(new_value: float):
	tint_progress = gradient.interpolate(ratio)
	emit_signal("health", self.value)
