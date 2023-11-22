extends Area2D

onready var door = get_node("..")
onready var collider = door.get_node("StaticBody2D/CollisionShape2D")
onready var doorOpenSound = door.get_node("DoorOpen")
onready var doorCloseSound = door.get_node("DoorClose")
onready var hint = $Hint
var isEnteredDoor : bool = false
var isKnob : bool = false

func _process(delta):
	if isEnteredDoor:
		if Input.is_action_just_released("action"):
			doorOpenSound.play()
			AudioManager.stop_forest()
			isKnob = true
			collider.disabled = true
	if not isEnteredDoor:
		collider.disabled = false

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		isEnteredDoor = true
		hint.visible = true
func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		if isKnob:
			doorCloseSound.play()
			isKnob = false
		isEnteredDoor = false
		hint.visible = false
