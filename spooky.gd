extends Control
var mainscene = load("res://world.tscn")
func _on_timer_timeout() -> void:
	Global.initializeVars()
	get_tree().change_scene_to_packed(mainscene)
