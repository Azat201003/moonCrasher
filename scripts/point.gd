extends Area2D

var isBusy = false
var busy = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_entered(body):
	if busy != null:
		busy.stay_in_area()
