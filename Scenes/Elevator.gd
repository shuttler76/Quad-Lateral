extends Sprite

var UI = preload("res://Scenes/ElevatorUI.tscn")

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "TYPE" in body and body.TYPE == "Player":
		var floorUI = UI.instance()
#		floorUI.rect_position = Vector2(256,160)
		get_parent().get_node("CanvasLayer").add_child(floorUI)
		pass
