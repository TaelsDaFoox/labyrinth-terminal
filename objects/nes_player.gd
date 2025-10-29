extends Sprite2D
@onready var playerReal = null
@onready var spr = $NesEnemy
var animframe := 0.0
func _ready() -> void:
	playerReal = get_parent().get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	if playerReal:
		position.x=playerReal.position.x*3.2+128
		position.y=playerReal.position.z*3.2+128
	else:
		print("player not real")

func _process(delta: float) -> void:
	animframe = fmod(animframe+delta*6,4.0)
	spr.frame=int(animframe)
