extends KinematicBody2D

onready var point = position
var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	var collision = move_and_collide(velocity)
	if collision:
        # To make the other kinematicbody2d move as well
		if "velocity" in collision.collider:
			collision.collider.move_and_collide(velocity)
#		else:
#			if (!$Timer.is_stopped()) :
#				$Timer.stop()
#			else:
#				$Timer.start()
			
	if (!$Timer.is_stopped()) :
		velocity.x+=0.25
	else:
		velocity.x = -5

