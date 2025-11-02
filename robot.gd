extends CharacterBody3D
@export var nesRobot: CharacterBody2D
@onready var model = $model
@onready var anim = $model/AnimationPlayer

func _physics_process(delta: float) -> void:
	if nesRobot:
		position.x=(nesRobot.position.x-128)/3.2
		position.z=(nesRobot.position.y-128)/3.2
		rotation.y=-nesRobot.movedir+PI/2
		if nesRobot.againstWall():
			anim.play("Idle",0.1,1.0)
		else:
			anim.play("Walk",0.1,2.0)
		#print(position)
