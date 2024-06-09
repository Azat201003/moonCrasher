extends Control

@onready
var levelsByName = {
	"Level 1" : "res://scenes/level1.tscn",
	"Level 2" : "res://scenes/level2.tscn",
	"Level 3" : "res://scenes/level3.tscn"
}
@onready
var levelsIconsByName = {
	"Level 1" : load("res://res/textures/level1Icon.png"),
	"Level 2" : load("res://res/textures/level1Icon.png"),
	"Level 3" : load("res://res/textures/level1Icon.png")
}

const levelsNames = ["Level 1", "Level 2", "Level 3"]
const countLevels = 3

var levelIndex = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_select"):
		$AudioStreamPlayer.play()
		if $AudioStreamPlayer.finished:
			get_tree().change_scene_to_file(levelsByName[$levelName.text])
		
	if Input.is_action_just_released("ui_right"):
		levelIndex += 1
		levelIndex %= countLevels
	if Input.is_action_just_released("ui_left"):
		levelIndex -= 1
		levelIndex += countLevels
		levelIndex %= countLevels
	
	$levelName.text = levelsNames[levelIndex]
	$levelIcon.texture = levelsIconsByName[$levelName.text]

func _on_button_button_up():
	get_tree().change_scene_to_file(levelsByName[$levelName.text])


func _on_arrow_left_button_up():
		levelIndex -= 1
		levelIndex += countLevels
		levelIndex %= countLevels


func _on_arrow_right_button_up():
		levelIndex += 1
		levelIndex %= countLevels
