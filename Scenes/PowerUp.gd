extends AnimatedSprite


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if ("TYPE" in body and body.TYPE == "Player"):
		body.jumpMax+=1
		queue_free()
	pass # Replace with function body.
