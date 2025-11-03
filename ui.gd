extends Control
@onready var controlprompt = $controlPrompt
@onready var energylabel = $energyLabel

func _process(delta: float) -> void:
	energylabel.text = str(int(ceil(Global.power)))+"/100"
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
