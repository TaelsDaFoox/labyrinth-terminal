extends Control
@onready var controlprompt = $controlPrompt

func _process(delta: float) -> void:
	if Global.inControlRange:
		if Global.controllingGame:
			controlprompt.text = "Press E to stop controlling"
		else:
			controlprompt.text = "Press E to control game"
	else:
		controlprompt.text = ""
