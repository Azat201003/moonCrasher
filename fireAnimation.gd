extends AnimatedSprite2D

var now = "none"

func start():
	play("start")
	now = "starting"
	
func end():
	play("end")
	now = "ending"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_finished():
	if now == "starting":
		play("idle")
		now = "idle"
	if now == "ending":
		play("none")
		now = "none"

