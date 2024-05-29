extends CharacterBody2D

var speed = 0
const attack = 1./100.

func _process(_delta):
	move_and_slide()

func collide():
	queue_free()
