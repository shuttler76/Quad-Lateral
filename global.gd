extends Node

var jumpMax = 1
var prevZone = 0
var currentZone = 0
var point = Vector2(0,198)
var player = null

func _process(delta):
	if (player != null && prevZone != currentZone):
		player.position = point
		prevZone = currentZone