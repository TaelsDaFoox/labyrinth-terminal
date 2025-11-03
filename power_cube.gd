extends Area3D
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("control game"):
		if not Global.holdingBattery:
			Global.holdingBattery=true


func _on_body_entered(body: Node3D) -> void:
	Global.inBatteryRange=true
	print ("entered battery range")


func _on_body_exited(body: Node3D) -> void:
	Global.inBatteryRange=false
	print ("left battery range")
