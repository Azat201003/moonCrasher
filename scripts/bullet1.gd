extends CharacterBody2D

var speed = 0
const attack = 1./100.

func _process(_delta):
	if sqrt(position.x ** 2 + position.y ** 2) > 10000:
		queue_free()
	move_and_slide()

func collide():
	queue_free()

func attacking(hp):
	collide()
