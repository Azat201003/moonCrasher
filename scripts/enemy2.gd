extends StaticBody2D

var goto = null
var shooting = false
var timer = Timer.new()
var isRechange = false
var bulletScene
var bulletSpawn
const bulletSpeed = 20

var nowIdle = "idle_front"

func get_nearest_point():	
	var points = get_parent().get_parent().get_node("player").get_node("points").get_children()
	
	var _point = points[0]
	for i in points:
		if not i.isBusy:
			if i.global_position.distance_to(global_position) < _point.global_position.distance_to(global_position):
				_point = i
	
	_point.isBusy = true
	_point.busy = self
	
	if _point == points[0] or _point == points[4]:
		nowIdle = "idle_front"
		scale.x = -1
	if _point == points[5] or _point == points[3]:
		nowIdle = "idle_front"
		scale.x = 1
	if _point == points[7] or _point == points[1]:
		nowIdle = "idle_back"
		scale.x = 1
	if _point == points[2] or _point == points[6]:
		nowIdle = "idle_back"
		scale.x = -1
		
	
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
	
func stay_in_area():
	shooting = true
	$AnimatedSprite2D.play("attack")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if goto == null and not shooting:
		goto = get_nearest_point()
		
	elif not shooting:
		moveTo(goto.global_position)
		
	if shooting and not isRechange:
		timer.set_wait_time(0.2)
		timer.start()
		isRechange = true
		
	if goto != null:
		if global_position.distance_to(goto.global_position):
			timer.connect("timeout", idleAnim)
		

func idleAnim():
	$AnimatedSprite2D.play(nowIdle)
	timer.disconnect("timeout", idleAnim)
