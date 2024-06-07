extends StaticBody2D

func get_nearest_point():
	var pointsObj = get_parent().get_parent().get_node("player").get_node("points")
	var points = [
		pointsObj.get_node("point1"),
		pointsObj.get_node("point2"),
		pointsObj.get_node("point3"),
		pointsObj.get_node("point4"),
		pointsObj.get_node("point5"),
		pointsObj.get_node("point6"),
		pointsObj.get_node("point7"),
		pointsObj.get_node("point8"),
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
