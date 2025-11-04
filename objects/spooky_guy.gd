extends CharacterBody3D
@onready var nav := $NavigationAgent3D
@export var movespd :=5
@onready var spr := $Sprite3D
var animframe := 0.0
var nesenemy: CharacterBody2D
#func _ready() -> void:
func _physics_process(delta: float) -> void:
	animframe = fmod(animframe+delta*15,8.0)
	spr.frame=int(animframe)
	nav.set_target_position(Vector3(Global.playerpos.x,global_position.y,Global.playerpos.z))
	var nextpos=nav.get_next_path_position()
	velocity = global_position.direction_to(nextpos)*movespd
	#velocity.y=0
	#print(velocity)
	move_and_slide()
	#position.y=1.7
