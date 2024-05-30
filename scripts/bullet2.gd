extends CharacterBody2D

var speed = 0
const attack = 1./20.
var timer = Timer.new()
@onready
var spawnPos = position

func _process(_delta):
	if sqrt((spawnPos.x - position.x) ** 2 + (spawnPos.y - position.y) ** 2) > 700:
		collide()
	move_and_slide()

func destroy():
	queue_free()
	
func _ready():
	timer.connect("timeout", destroy)
	add_child(timer)

func collide():
	timer.set_wait_time(1)
	timer.start()
	$Bullet1.play("end")
