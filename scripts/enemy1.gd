extends StaticBody2D

var isDie = false
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	add_child(timer)
	timer.connect("timeout", queue_free)


func _on_area_2d_body_entered(body):
	if not isDie:
		$CollisionShape2D.queue_free()
		$AnimatedSprite2D.play("attack")# Add a timer to this node
		timer.set_wait_time(1)
		timer.start()
	
	body.attacking(50)
	isDie = true
