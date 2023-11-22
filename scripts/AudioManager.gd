extends Node

var titleScreen = load("res://Sounds/Creepy background2.wav")
var forest = load("res://Sounds/NightForest.wav")

func _ready():
	pass # Replace with function body.

func play_title():
	$BackgroundMusic.stream = titleScreen
	$BackgroundMusic.play()

func stop_title():
	$BackgroundMusic.stop()

func play_forest():
	$Forest.stream = forest
	$Forest.play()

func stop_forest():
	$Forest.stop()
