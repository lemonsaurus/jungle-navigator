extends TextureProgress
export (Gradient) var gradient


func _on_health_updated(new_health):
	$Tween.interpolate_property(
		self, "value",
		self.value, new_health, 3,
		Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	$Tween.start()
	tint_progress = self.gradient.interpolate(self.ratio)
