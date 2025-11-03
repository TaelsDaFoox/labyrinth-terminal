extends Control
@onready var controlprompt = $controlPrompt
@onready var energylabel = $energyLabel
var redcol = Color(1.0,0.0,0.0,1.0)
var whitecol = Color(1.0,1.0,1.0,1.0)

func _process(delta: float) -> void:
	energylabel.text = str(int(ceil(Global.power)))+"/100"
	if Global.power<25.0:
		energylabel.set("theme_override_colors/font_color",redcol)
	else:
		energylabel.set("theme_override_colors/font_color",whitecol)
	if Global.inControlRange:
		if Global.controllingGame:
			controlprompt.text = "Press E to stop controlling"
		else:
			controlprompt.text = "Press E to control game"
		if Global.monitorOn:
			controlprompt.text = controlprompt.text+"\nPress Q to turn off"
		else:
			if Global.power>0.0:
				controlprompt.text = controlprompt.text+"\nPress Q to turn on"
			else:
				controlprompt.text = controlprompt.text+"\n[!]OUT OF POWER, CAN'T TURN ON[!]"
	else:
		if Global.inBatteryRange:
			if Global.holdingBattery:
				controlprompt.text = "You're holding a battery."
			else:
				controlprompt.text = "Press E to take a battery."
		else:
			controlprompt.text = ""
