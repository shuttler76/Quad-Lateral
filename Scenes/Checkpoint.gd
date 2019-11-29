extends Area2D

export(Vector2) var point


func _ready():
	pass


func on_body_entered(body):
#	print(body)
	if "TYPE" in body and body.TYPE == "Player":
		body.checkpoint = point
		queue_free()
#		print("wow")
		pass