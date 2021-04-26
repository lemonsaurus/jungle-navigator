extends Label


func _on_gold_updated(new_gold: int):
	var old_gold = int(self.text)

	$Tween.interpolate_method(
		self, "_update",
		int(self.text), new_gold, 2.5,
		Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	$Tween.start()


func _update(new_gold: int):
	self.set_text(str(new_gold))
