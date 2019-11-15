extends KinematicBody2D


var in_air = false
var jump = false
var wall = false
var jumpCounter = 0
export(int) var jumpMax = 0
var velocity = Vector2(0,0)
var gravity = 50
var dead = false
var grab = false
var walljump = false

var deathParticles = preload("res://Scenes/DeathPart.tscn")

const MOVE_SPEED = 250
const TYPE = "Player"

onready var checkpoint = position


func _ready():
	pass 


func _physics_process(delta):
	if (!dead) :
		velocity = move_and_slide(velocity, Vector2(0, -1))
		if (is_on_floor()):
			if (in_air == true):
				in_air = false
				jump = false
				walljump = false
				$AnimationPlayer.play("Land")
				jumpCounter = jumpMax
		else:
			if !in_air:
				in_air = true
				$Coyote.start()
			if (jumpCounter <= 0 && $Coyote.is_stopped()):
				jump = true
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
			grab = true
			walljump = false
			if Input.is_action_just_pressed("ui_up"):
				velocity.y = -700
				walljump = true
	#			velocity.x = velocity.x/abs(velocity.x)*-100
		else:
			if (grab==true and velocity.y >= 0 and ! walljump):
				$CoyoteWall.start()
				print("started")
				grab = false
			if walljump:
				grab = false
			pass

		#Allows player to jump for a brief period after getting off of a wall
		if (!$CoyoteWall.is_stopped()):
			if Input.is_action_just_pressed("ui_up"):
				velocity.y = -700
				print("stopped")
				$CoyoteWall.stop()

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
	dead = true
	print("dead")
	var dedP = deathParticles.instance()
	dedP.position = position
	get_parent().add_child(dedP)
	$DeathTimer.start()
	$Camera2D.drag_margin_bottom = 10000000
	$Camera2D.drag_margin_top = 10000000
	visible = false
	position = checkpoint
	velocity = Vector2(0,0)

func _death_timeout():
	$Camera2D.drag_margin_bottom = 0.2
	$Camera2D.drag_margin_top = 0.2
	visible = true
	dead = false
	pass # Replace with function body.
