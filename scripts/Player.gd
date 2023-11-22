extends KinematicBody2D

var speed : int = 100
 
var vel : Vector2 = Vector2()

onready var sprite = $PlayerSprite

func _physics_process (delta):
	move(delta)

func move(delta):
	vel.x = 0
		# movement inputs
	if Input.is_action_pressed("left"):
		vel.x -= speed
		sprite.play('Run')
	elif Input.is_action_pressed("right"):
		vel.x += speed
		sprite.play('Run')
	else:
		sprite.play('Idle')
	vel = move_and_slide(vel, Vector2.UP)
	if vel.x > 0:
		sprite.flip_h = false
	elif vel.x < 0:
		sprite.flip_h = true




