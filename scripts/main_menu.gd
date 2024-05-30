extends Control

const countbuttons = 4
@onready
var labels = [  $Label2,
				$Label3,
				$Label4,
				$Label5]
@onready
var labels2 = [  $Label6,
				$Label7,
				$Label8,
				$Label9]

var indexbutton = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_down"):
		indexbutton += 1
		indexbutton %= countbuttons
	
	if Input.is_action_just_released("ui_up"):
		indexbutton -= 1
		indexbutton += countbuttons
		indexbutton %= countbuttons
	
	if Input.is_action_just_released("ui_select"):
		if indexbutton == 0:
			get_tree().change_scene_to_file("scenes/levels.tscn")
		if indexbutton == 1:
			get_tree().change_scene_to_file("scenes/person.tscn")
		if indexbutton == 2:
			get_tree().change_scene_to_file("scenes/settings.tscn")
		if indexbutton == 3:
			get_tree().quit()
			
	for i in range(countbuttons):
		if i == indexbutton:
			labels[i].visible = false
			labels2[i].visible = true
		else:
			labels[i].visible = true
			labels2[i].visible = false
