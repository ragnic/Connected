extends Area2D

# STARTS FOREST SOUNDS !!

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Music_body_entered(body):
	if body.name == "Player":
		AudioManager.play_forest()
