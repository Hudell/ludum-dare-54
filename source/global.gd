extends Node

var anxiety = 0:
	set(value):
		if (anxiety != value):
			anxiety = value
			emit_signal("anxiety_changed")

var anxiety_increasing = true
const min_anxiety = 0
const max_anxiety = 10

signal anxiety_changed

func add_anxiety(value):
	self.anxiety = clamp(anxiety + value, min_anxiety, max_anxiety)
	anxiety_increasing = true
	if !$Timer.is_stopped():
		$Timer.stop()
	$Timer.start(0)

func maybe_decrease_anxiety(delta):
	if anxiety_increasing:
		return
	
	self.anxiety = clamp(anxiety - delta * 3, min_anxiety, max_anxiety)
		
func _on_timer_timeout():
	anxiety_increasing = false
