extends Node2D

var hp = 200
var maxHP = 200

var timer = Timer.new()

func destroy():
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.connect("timeout", destroy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_body_entered(body):
	hp = max(0, hp - abs(body.speed) / 500)
	$moon.frame = int((maxHP - hp) / (maxHP / 4))
	if hp == 0:
		$moon.play("crashed")# Add a timer to this node
		timer.set_wait_time(1)
		timer.start()
	body._speed = -1
