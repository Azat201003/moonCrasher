extends Node2D
var bulletScene
const bulletSpeed = 300
var bulletSpawns
var timer = Timer.new()
var isRechange = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.connect("timeout", shoot)
	bulletScene = load("res://scenes/bullet2.tscn")

func shoot():
	print("shoot")
	bulletSpawns = [get_node("startBullet1"), get_node("startBullet2")]
	var instanceBullet = bulletScene.instantiate()
	instanceBullet.rotation = rotation
	instanceBullet.position = bulletSpawns[0].global_position
	instanceBullet.speed = bulletSpeed
	instanceBullet.velocity = Vector2(0, -1).rotated(rotation) * bulletSpeed
	get_parent().get_parent().get_node("bullets").add_child(instanceBullet)
	instanceBullet = bulletScene.instantiate()
	instanceBullet.rotation = rotation
	instanceBullet.position = bulletSpawns[1].global_position
	instanceBullet.speed = bulletSpeed
	instanceBullet.velocity = Vector2(0, -1).rotated(rotation) * bulletSpeed
	get_parent().get_parent().get_node("bullets").add_child(instanceBullet)
	isRechange = false
	timer.stop()

func idleAnim():
	$AnimatedSprite2D.play("idle")
	timer.disconnect("timeout", idleAnim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rotation = get_parent().get_child(0).rotation
	position = get_parent().get_child(0).position
	if Input.is_action_just_pressed("ui_shooting"):
		$AnimatedSprite2D.play("fire")
	if Input.is_action_just_released("ui_shooting"):
		timer.connect("timeout", idleAnim)
	if Input.is_action_pressed("ui_shooting") and !isRechange:
		timer.set_wait_time(1)
		timer.start()
		isRechange = true
