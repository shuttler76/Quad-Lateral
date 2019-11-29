extends Node2D


func _ready():
	OS.window_size = Vector2(1024,640)
	var screen_size = OS.get_screen_size(0)
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	
	global.currentZone = 1
	pass