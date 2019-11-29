extends Control


var floorList = []
onready var player = get_parent().get_parent().get_node("Player")


func _ready():
	var checkpoint = get_parent().get_parent().get_node("Checkpoints")
	floorList = checkpoint.get_children()
	pass


func _process(delta):
	
	pass



func _on_ItemList_item_activated(index):
	if(index == 0):
		player.position = floorList[8].point
		player.checkpoint = player.position
	if(index == 1):
		player.position = floorList[4].point
		player.checkpoint = player.position
	if(index == 2):
		player.position = Vector2(235,292)
		player.checkpoint = player.position
	queue_free()
	pass # Replace with function body.


func _on_Button_pressed():
	queue_free()
	pass # Replace with function body.
