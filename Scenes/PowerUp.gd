extends AnimatedSprite


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if ("TYPE" in body and body.TYPE == "Player"):
		global.jumpMax+=1
		body.jumpCounter=global.jumpMax
		queue_free()
	pass # Replace with function body.
