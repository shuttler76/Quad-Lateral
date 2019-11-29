extends AnimatedSprite

func _ready():

	pass # Replace with function body.

func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	if "TYPE" in body and body.TYPE == "Player" and body.dead == false:
		body.death()

func _on_Timer_timeout():
	$Area2D/CollisionPolygon2D.disabled = false
	frame = 0
	play("default")
	$Timer2.start()
	print("spike")
	pass

func _on_Timer2_timeout():
	$Area2D/CollisionPolygon2D.disabled = true
	pass

func _on_Area2D2_body_entered(body):
	if "TYPE" in body and body.TYPE == "Player" and body.dead == false:
		$Timer.start()
	pass
