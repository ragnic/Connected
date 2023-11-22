extends Node2D
var isInisde : bool
onready var hint = $Hint
func _process(delta):
	if isInisde:
		if Input.is_action_just_released("action"):
			get_tree().change_scene("res://scenes/SwitchBoard.tscn")

func _on_Area2D_body_entered(body):
	isInisde = true
	hint.visible = true

func _on_Area2D_body_exited(body):
	isInisde = false
	hint.visible = false
