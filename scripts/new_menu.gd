extends Control

func _ready():
	pass

func _process(delta):
	pass

#
#const countbuttons = 4
#@onready
#var labels = [  $Label1,
				#$Label2,
				#$Label3,
				#$Label4]
#
#var indexbutton = 0
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Input.is_action_just_released("ui_down"):
		#indexbutton += 1
		#indexbutton %= countbuttons
	#
	#if Input.is_action_just_released("ui_up"):
		#indexbutton -= 1
		#indexbutton += countbuttons
		#indexbutton %= countbuttons
	#
	#if Input.is_action_just_released("ui_select"):
		#
		#if indexbutton == 0:
			#get_tree().change_scene_to_file("scenes/levels.tscn")
		#if indexbutton == 1:
			#get_tree().change_scene_to_file("scenes/person.tscn")
		#if indexbutton == 2:
			#get_tree().change_scene_to_file("scenes/settings.tscn")
		#if indexbutton == 3:
			#get_tree().quit()
			#
	#for i in range(countbuttons):
		#if i == indexbutton:
			#labels[i].label_settings.font_size = 70
		#else:
			#labels[i].label_settings.font_size = 62
#
##
##func _on_label_6_button_up():
	##
	##get_tree().change_scene_to_file("scenes/levels.tscn")
##
##func _on_label_3_button_up():
	##
	##get_tree().change_scene_to_file("scenes/person.tscn")
##
##
##func _on_label_4_button_up():
	##
	##get_tree().change_scene_to_file("scenes/settings.tscn")
##
##
##func _on_label_5_button_up():
	##
	##get_tree().quit()
	##



func _on_подтвердить_button_up():
	if $selected.selected == 0:
		get_tree().change_scene_to_file("res://scenes/levels.tscn")
	if $selected.selected == 1:
		get_tree().change_scene_to_file("res://scenes/person.tscn")
	if $selected.selected == 2:
		get_tree().change_scene_to_file("res://scenes/settings.tscn")
	if $selected.selected == 3:
		get_tree().quit()
		
