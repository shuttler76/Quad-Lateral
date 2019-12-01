extends Node2D


onready var player = get_parent().get_parent().get_node("Player")
export var startVal = 0
var length = null
var exit = false
export(bool) var yee


func _physics_process(delta):
	if $RayCast2D.is_colliding():
		length = $RayCast2D.get_collision_point().y - global_position.y
	else:
		length = $RayCast2D.cast_to.y
	$Sprite.scale.y = length

	$StaticBody2D/CollisionShape2D.shape.points[2].y = length
	$StaticBody2D/CollisionShape2D.shape.points[3].y = length
	
	$Area2D/CollisionShape2D.shape.points[2].y = length
	$Area2D/CollisionShape2D.shape.points[3].y = length
	
	if (yee):
		print($StaticBody2D/CollisionShape2D.shape.points)
		print(length)
		print(abs(player.position.y - global_position.y))

	var value = player.jumpCounter - startVal
	$RichTextLabel.text = str(value)
	if (value == 0):
		$Sprite.modulate.a = 0.5
#		$StaticBody2D.collision_layer = 0
		$StaticBody2D/CollisionShape2D.disabled = true
		$Area2D.collision_mask = 0
	else:
		$Sprite.modulate.a = 1
#		$StaticBody2D.collision_layer = 1
		$StaticBody2D/CollisionShape2D.disabled = false
		$Area2D.collision_mask = 1
	pass


func _on_Area2D_body_entered(body):
#	print(body)
#	print($Area2D)
#	print(str($Area2D/CollisionShape2D.disabled))
	if "TYPE" in body and body.TYPE == "Player" and body.dead == false:
		body.death()
