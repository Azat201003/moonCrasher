extends CharacterBody2D

var goto = null
var shooting = false
var timer = Timer.new()
var isRechange = false
var bulletScene
var bulletSpawn
const bulletSpeed = 20
const speed = 100

var nowIdle = "idle_front"

func get_nearest_point():	
	var points = get_parent().get_parent().get_node("player").get_child(0).get_node("points").get_children()
	
	var _point = points[0]
	for i in points:
		if i.isBusy != null:
			if i.global_position.distance_to(global_position) < _point.global_position.distance_to(global_position):
				_point = i
	
	_point.isBusy = true
	_point.busy = self
	
	print(_point)
	return _point

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.connect("timeout", shoot)
	bulletScene = load("res://scenes/bullet1.tscn")

func shoot():
	print("shoot")
	bulletSpawn = get_node("startBullet")
	var instanceBullet = bulletScene.instantiate()
	instanceBullet.rotation = rotation
	instanceBullet.position = bulletSpawn.global_position
	instanceBullet.speed = bulletSpeed
	instanceBullet.velocity = Vector2(0, -1).rotated(rotation) * bulletSpeed
	get_parent().get_node("bullets").add_child(instanceBullet)
	isRechange = false
	timer.stop()

func moveTo(pos):
	var dist = global_position.distance_to(pos)
	var x = (pos.x - global_position.x) / dist
	var y = (pos.y - global_position.y) / dist
	velocity.x = x * speed
	velocity.y = y * speed
	move_and_slide()
	
func stay_in_area():
	shooting = true
	$AnimatedSprite2D.play("attack")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if goto == null and not shooting:
		goto = get_nearest_point()
		
	elif not shooting:
		moveTo(goto.global_position)
		$AnimatedSprite2D.animation = nowIdle
		
	if shooting:
		var player = get_parent().get_parent().get_node("player").get_child(0)
		if player.global_position.x < global_position.x:
			scale.x = -1
		if player.global_position.x > global_position.x:
			scale.x = 1
		if player.global_position.y < global_position.y:
			nowIdle = "idle_back"
		if player.global_position.y > global_position.y:
			nowIdle = "idle_front"
	
	if shooting and !isRechange:
		timer.set_wait_time(0.2)
		timer.start()
		isRechange = true
		
	if goto != null:
		if global_position.distance_to(goto.global_position) > 100:
			timer.connect("timeout", idleAnim)
	
		if !shooting:
			if goto.global_position.x < global_position.x and scale.x == 1:
				scale.x = -1
			if goto.global_position.x > global_position.x and scale.x == 1:
				scale.x = 1
			if goto.global_position.y < global_position.y:
				nowIdle = "idle_back"
			if goto.global_position.y > global_position.y:
				nowIdle = "idle_front"
		

func idleAnim():
	goto.busy = false
	goto = null
	$AnimatedSprite2D.play(nowIdle)
	timer.disconnect("timeout", idleAnim)
