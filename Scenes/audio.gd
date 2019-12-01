extends Control

var sfx = AudioServer.get_bus_index("SFX")
var music = AudioServer.get_bus_index("Music")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(AudioServer.is_bus_mute(sfx))
	pass


func _on_CheckBox_button_up():
	AudioServer.set_bus_mute(music, true)
	pass # Replace with function body.


func _on_CheckBox_button_down():
	AudioServer.set_bus_mute(music, false)
	pass # Replace with function body.


func _on_CheckBox2_button_down():
	AudioServer.set_bus_mute(sfx, false)
	pass # Replace with function body.


func _on_CheckBox2_button_up():
	AudioServer.set_bus_mute(sfx, true)
	pass # Replace with function body.


func _on_CheckBox_toggled(button_pressed):
	AudioServer.set_bus_mute(music, !button_pressed)
	pass # Replace with function body.


func _on_CheckBox2_toggled(button_pressed):
	AudioServer.set_bus_mute(sfx, !button_pressed)
	pass # Replace with function body.
