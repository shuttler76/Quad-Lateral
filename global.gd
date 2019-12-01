extends Node

var jumpMax = 0
var prevZone = 1
var currentZone = 0
var point
var player = null

func _process(delta):
	if (player != null && prevZone != currentZone):
		player.position = point
		prevZone = currentZone