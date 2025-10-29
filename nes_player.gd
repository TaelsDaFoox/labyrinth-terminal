extends CharacterBody2D
@onready var playerReal = null
@onready var spr = $Sprite
var animframe := 0.0
func _ready() -> void:
	playerReal = get_parent().get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	if playerReal:
		#var moveVector = Vector2((playerReal.position.x*3.2+128)-position.x,(playerReal.position.z*3.2+128)-position.y)
		position.x=playerReal.position.x*3.2+128
		position.y=playerReal.position.z*3.2+128
		#velocity = moveVector
		move_and_slide()
	else:
		print("player not real")

func _process(delta: float) -> void:
	animframe = fmod(animframe+delta*4,4.0)
	spr.frame=int(animframe)
