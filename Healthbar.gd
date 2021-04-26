extends TextureProgress
export (Gradient) var gradient


func _on_health_updated(new_health):
	$Tween.interpolate_property(
		self, "value",
		self.value, new_health, 2,
		Tween.TRANS_SINE, Tween.EASE_IN_OUT
	)
	$Tween.start()
	

func _on_value_changed(value):
	self.tint_progress = self.gradient.interpolate(self.ratio)
