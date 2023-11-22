extends TextureButton

export var upPosition : Vector2
var downPosition : Vector2
var pressCount :int 

func _ready():
	pressCount = 0
	downPosition = self.get_global_position()


func _on_TextureButton_pressed():
	if pressCount == 0:
		self.set_global_position(upPosition)
		pressCount += 1
	elif pressCount == 1:
		self.set_global_position(downPosition)
		pressCount -= 1
		
