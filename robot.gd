extends CharacterBody3D
@export var nesRobot: CharacterBody2D

func _physics_process(delta: float) -> void:
	if nesRobot:
		position.x=(nesRobot.position.x-128)/3.2
		position.z=(nesRobot.position.y-128)/3.2
		#print(position)
