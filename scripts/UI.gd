extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.play_title()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/MainScene.tscn")
	AudioManager.stop_title()
