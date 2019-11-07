extends KinematicBody2D


var in_air = false
var jump = false
var wall = false
var jumpCounter = 0
var jumpMax = 0
var velocity = Vector2(0,0)
var gravity = 50

const MOVE_SPEED = 250
const TYPE = "Player"

onready var checkpoint = position


func _ready():
	pass 


func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if (is_on_floor()):
		if (in_air == true):
			in_air = false
			jump = false
			$AnimationPlayer.play("Land")
			jumpCounter = jumpMax
	else:
		if (jumpCounter <= 0):
			jump = true
		in_air = true
		$AnimationPlayer.play("Jump")

	if Input.is_action_pressed("ui_left"):
		velocity.x = -MOVE_SPEED
		$RayCast2D.cast_to.x = -5
	else: if Input.is_action_pressed("ui_right"):
		velocity.x = MOVE_SPEED
		$RayCast2D.cast_to.x = 5
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_hold") and $RayCast2D.is_colliding() and velocity.y >= 0:
		velocity.y = 40
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -700
#			velocity.x = velocity.x/abs(velocity.x)*-100
	else:
		gravity = 50
		pass

	velocity.y += gravity

	if Input.is_action_just_pressed("ui_up") and !jump:
		if (jumpCounter <= 0):
			jump = true
		else:
			if in_air:
				jumpCounter-=1
		velocity.y = -700
		$AnimationPlayer.play("Jump")

func death():
	position = checkpoint