extends CharacterBody2D

var speed = 0
var _speed = 0
var _rotation = 0

var maxSpeed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_W):
		_speed += 0.1
	if Input.is_key_pressed(KEY_S):
		_speed -= 0.1
	if Input.is_key_pressed(KEY_D):
		rotation += 0.01
	if Input.is_key_pressed(KEY_A):
		rotation -= 0.01
	if _speed != 0:
		_speed -= 0.01 * (_speed / abs(_speed))
	
	_speed = min(_speed, maxSpeed)
	
	speed = max(0,  _speed * _speed) ** 2
	if _speed != 0:
		speed *= _speed / abs(_speed)
	
	velocity = Vector2(0, -1).rotated(rotation) * speed * delta
	move_and_slide()
