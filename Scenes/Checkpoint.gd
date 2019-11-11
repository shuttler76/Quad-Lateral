extends Area2D

export(Vector2) var point

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_body_entered(body):
#	print(body)
	if "TYPE" in body and body.TYPE == "Player":
		body.checkpoint = point
#		print("wow")
		pass