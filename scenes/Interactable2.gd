
extends Area2D

onready var dialog = get_node("/root/MainScene/DialogPlayer")
var isHit : bool = false

func _on_Interactable2_body_entered(body):
	if body.name == "Player":
		dialog.play_dialog("House/Intro")
