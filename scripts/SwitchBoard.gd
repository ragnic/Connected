extends Control

class LineConnection:
	var fromWho : String
	var toWhom : String

var lineConnection = LineConnection.new()
var buttonScript = preload("res://scripts/Button.gd")
var wires = []

func _ready():
	lineConnection.fromWho = ""
	lineConnection.toWhom = ""

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://scenes/MainScene.tscn")
func _draw():
	draw_line(Vector2(10, 30), Vector2(300, 70), 80)

func changeLineState(lineStatus, lineNumber):
	
	if lineStatus == buttonScript.LineStatus.waiting:
		if lineConnection.fromWho == "":
			lineConnection.fromWho = lineNumber
			lineConnection.toWhom = "Home"
			var index = findChildrenNodeIndex(lineConnection.fromWho)
			self.get_child(0).get_child(index).get_child(0).changeLineStatus \
			(buttonScript.LineStatus.connecting)
			$Tutorial1.visible = false
			$Tutorial2.visible = true
			wires.push_back(Line2D.new())
			self.add_child(wires[wires.size() - 1])
			
	
	if lineStatus == buttonScript.LineStatus.home:
		if lineConnection.toWhom == lineNumber:
			
			addPoint(wires.size() - 1, lineConnection.fromWho)
			addPoint(wires.size() - 1, "Home")
			
			lineConnection.toWhom = "Button 5"
			$Tutorial2.visible = false
			$Tutorial3.visible = true
			
	if lineStatus == buttonScript.LineStatus.vacant:
		if lineConnection.toWhom == lineNumber:
			removePoint(wires.size() - 1, 1, "Home")
			addPoint(wires.size() - 1, lineConnection.toWhom)
			
			
			var index = findChildrenNodeIndex(lineConnection.fromWho)
			self.get_child(0).get_child(index).get_child(0).changeLineStatus \
			(buttonScript.LineStatus.busy)
			
			index = findChildrenNodeIndex(lineConnection.toWhom)
			self.get_child(0).get_child(index).get_child(0).changeLineStatus \
			(buttonScript.LineStatus.busy)
			
			lineConnection.fromWho = ""
			lineConnection.toWhom = ""
			$Tutorial3.visible = false
			$Tutorial4.visible = true
	
func removePoint(lineIndex, pointIndex, btnName):
	var index = findChildrenNodeIndex(btnName)
	var button = self.get_child(0).get_child(index).get_child(0)
	var point = button.get_global_position() + button.get_size() / 2
	wires[lineIndex].remove_point(pointIndex)
	
func addPoint(lineIndex, btnName):
	var index = findChildrenNodeIndex(btnName)
	var button = self.get_child(0).get_child(index).get_child(0)
	var point = button.get_global_position() + button.get_size() / 2
	wires[lineIndex].add_point(point)
	
func findChildrenNodeIndex(name):
	for i in range(self.get_child(0).get_child_count()):
			var child = self.get_child(0).get_child(i)
			if child.get_name() == name:	
				return i
