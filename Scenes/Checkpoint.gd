extends Area2D

export(Vector2) var point
var is_checked = false

func _ready():
	pass


func on_body_entered(body):
#	print(body)
	if "TYPE" in body and body.TYPE == "Player" and !is_checked:
		body.checkpoint = point
		is_checked = true
#		queue_free()
#		print("wow")
		pass