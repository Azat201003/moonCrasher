extends Node2D

var hp = 200
var maxHP = 200
var isDie = false

var timer = Timer.new()

func destroy():
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.connect("timeout", destroy)


func _on_area_2d_body_entered(body):
	if !isDie:
		hp = max(0, hp - abs(body.speed) * body.attack)
		$moon.frame = int((maxHP - hp) / (maxHP / 4.))
		if hp == 0:
			isDie = true
			$CollisionShape2D.queue_free()
			$moon.play("crashed")# Add a timer to this node
			timer.set_wait_time(1)
			timer.start()
		body.collide()
