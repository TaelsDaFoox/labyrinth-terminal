extends CharacterBody2D
@export var targetObj: CharacterBody3D = null
@onready var spr = $NesEnemy
var animframe := 0.0
func _process(delta: float) -> void:
	animframe = fmod(animframe+delta*15,8.0)
	spr.frame=int(animframe)
func _physics_process(delta: float) -> void:
	if targetObj:
		#var moveVector = Vector2((playerReal.position.x*3.2+128)-position.x,(playerReal.position.z*3.2+128)-position.y)
		position.x=targetObj.position.x*3.2+128
		position.y=targetObj.position.z*3.2+128
		#velocity = moveVector
		move_and_slide()
	else:
		print("enemy not real")
