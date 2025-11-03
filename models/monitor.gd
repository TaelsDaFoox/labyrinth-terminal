extends Node3D
@onready var model = $Cube
@onready var sfx = $monitorSFX
func _ready() -> void:
	Global.robotInput.connect(beep)
func _on_area_3d_body_entered(body: Node3D) -> void:
	Global.inControlRange=true
	if Global.holdingBattery:
		Global.holdingBattery=false
		Global.power=100.0
		Global.monitorOn=true
func _on_area_3d_body_exited(body: Node3D) -> void:
	Global.inControlRange=false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("control game"):
		if Global.inControlRange:
			Global.controllingGame = not Global.controllingGame
	if event.is_action_pressed("power button"):
		if Global.inControlRange:
			Global.monitorOn = not Global.monitorOn
func _process(delta: float) -> void:
	if Global.monitorOn:
		model.get_surface_override_material(1).emission_enabled=true
	else:
		model.get_surface_override_material(1).emission_enabled=false

func beep():
	sfx.pitch_scale=randf_range(0.9,1.1)
	sfx.play()
