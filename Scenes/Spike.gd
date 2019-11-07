extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_body_entered(body):
#	print(body)
	if "TYPE" in body and body.TYPE == "Player":
		body.death()
		print("ow")
		pass
