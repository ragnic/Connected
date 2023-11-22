extends Button

enum LineStatus {
	busy, waiting, connecting, vacant, home
} 

export(int, "Busy", "Waiting", "Connecting", "Vacant", "Home") var lineStatus
onready var light = $Light
	
func _process(delta):
	if lineStatus == LineStatus.busy:
		changeLightColor(Color.green)
	elif lineStatus == LineStatus.waiting:
		changeLightColor(Color.red)
	elif lineStatus == LineStatus.connecting:
		changeLightColor(Color.red)
	elif lineStatus == LineStatus.vacant:
		changeLightColor(Color.gray)
	elif lineStatus == LineStatus.home:
		changeLightColor(Color.green)

func changeLightColor(color):
	var newStyle = StyleBoxFlat.new()
	newStyle.set_bg_color(color)
	newStyle.set_corner_radius_all(8)
	light.set('custom_styles/disabled', newStyle)

func changeLineStatus(status):
	lineStatus = status

func _on_Button_pressed():
	var buttonName = self.get_parent().get_name()
	var switchboard = self.get_owner()
	switchboard.changeLineState(lineStatus, buttonName)
