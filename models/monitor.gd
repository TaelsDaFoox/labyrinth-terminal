extends Node3D
func _on_area_3d_body_entered(body: Node3D) -> void:
	Global.inControlRange=true
func _on_area_3d_body_exited(body: Node3D) -> void:
	Global.inControlRange=false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("control game"):
		if Global.inControlRange:
			Global.controllingGame = not Global.controllingGame
