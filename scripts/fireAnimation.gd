extends AnimatedSprite2D

var now = "none"

func start():
	play("start")
	now = "starting"
	
func end():
	play("end")
	now = "ending"


func _on_animation_finished():
	if now == "starting":
		play("idle")
		now = "idle"
	if now == "ending":
		play("none")
		now = "none"

