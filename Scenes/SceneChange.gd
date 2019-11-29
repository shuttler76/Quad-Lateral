extends Area2D


export(String, FILE, ".tscn") var scene
export(Vector2) var point


func _ready():
	pass


func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	if "TYPE" in body and body.TYPE == "Player":
		get_tree().change_scene(scene)
		global.point = point
#		body.position = point
#		print("trying")
		pass