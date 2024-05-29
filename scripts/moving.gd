extends CharacterBody2D

var speed = 0
@export
var _speed = 0

var maxSpeed = 14
var attack = 1./500.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		_speed += 0.1
	if Input.is_action_pressed("ui_down"):
		_speed -= 0.1
	if Input.is_action_pressed("ui_right"):
		rotation += 0.04
	if Input.is_action_pressed("ui_left"):
		rotation -= 0.04
	
	_speed = max(min(_speed, maxSpeed), -maxSpeed)
	if _speed != 0: 
		_speed -= 0.01 * (_speed / abs(_speed))
	
	speed = max(0,  _speed ** 4)
	if _speed != 0:
		speed *= _speed / abs(_speed)
	
	velocity = Vector2(0, -1).rotated(rotation) * speed * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_up"):
		$fire.start()
	if Input.is_action_just_released("ui_up"):
		$fire.end()

func collide():
	_speed = -1
