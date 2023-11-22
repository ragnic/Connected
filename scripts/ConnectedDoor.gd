extends Area2D

export var goTo : int = 0
var isEnteredDoor : bool = false
onready var player = get_node("/root/MainScene/Player")
onready var camera = get_node("/root/MainScene/Camera2D")
onready var doorOpenSound = get_node("DoorOpen")
onready var hint = $Hint

func _process(delta):
	if isEnteredDoor == true:
		$Sprite.play("Open")
		if Input.is_action_just_released("action") and goTo != 0:
			$DoorOpen.play()
			var connectedDoor = get_node("/root/MainScene/House/ConnectedDoor" + String(goTo))
			player.position.x = connectedDoor.global_position.x 
			player.position.y = connectedDoor.global_position.y + 32 
			var distance = connectedDoor.global_position.y - global_position.y
			camera.position.y += distance
			doorOpenSound.play()

func _on_ConnectedDoor_body_entered(body):
	isEnteredDoor = true
	hint.visible = true
	
func _on_ConnectedDoor_body_exited(body):
	$Sprite.play("Idle")
	isEnteredDoor = false
	hint.visible = false

