extends CharacterBody2D
@onready var spr = $NesEnemy
var animframe := 0.0
func _process(delta: float) -> void:
	animframe = fmod(animframe+delta*15,8.0)
	spr.frame=int(animframe)
