extends CanvasLayer

func _ready():
	Global.connect("anxiety_changed", Callable(self, "anxiety_changed"))
	$AnxietyGauge/ColorRect.size.x = 0

func anxiety_changed():
	$AnxietyGauge/ColorRect.size.x = Global.anxiety * 5
