extends Node2D

@onready
var moons = [$moon1/StaticBody2D, $moon2/StaticBody2D, $moon3/StaticBody2D]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func countMoons():
	var numMoons = 0
	for i in moons:
		if is_instance_valid(i):
			numMoons += 1
	return numMoons

func happyEnd():
	get_tree().change_scene_to_file("scenes/levels.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if countMoons() <= 0:
		happyEnd()
	
