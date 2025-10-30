extends CharacterBody2D
@onready var playerReal = null
@onready var spr = $Sprite
@export var movespd := 60
@onready var collR: Area2D = $CollR
@onready var collL: Area2D = $CollL
@onready var collU: Area2D = $CollU
@onready var collD: Area2D = $CollD
var animframe := 0.0
var movedir := 0.0
var animNum := 0
func _ready() -> void:
	pass
	#playerReal = get_parent().get_parent().get_node("Player")

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		pacturn(PI)
	if Input.is_action_pressed("ui_right"):
		pacturn(0)
	if Input.is_action_pressed("ui_up"):
		pacturn(PI/-2)
	if Input.is_action_pressed("ui_down"):
		pacturn(PI/2)
	#var input_dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = (Vector2.RIGHT*movespd).rotated(movedir)
	move_and_slide()

func _process(delta: float) -> void:
	if againstWall():
		animframe = 1.0
	else:
		animframe = fmod(animframe+delta*8,4.0)
	
	spr.frame=int(animframe+animNum*4)

func pacturn(dir: float):
	print(collR.get_overlapping_bodies())
	if not movedir == dir:
		print(collU.get_overlapping_bodies())
		if dir == PI/-2 and not collU.get_overlapping_bodies():
			movedir = dir
			animNum = 2
			position.x=round((position.x+8)/16)*16-8
		if dir == PI/2 and not collD.get_overlapping_bodies():
			movedir = dir
			animNum = 0
			position.x=round((position.x+8)/16)*16-8
		if dir == 0 and not collR.get_overlapping_bodies():
			movedir = dir
			animNum = 1
			position.y=round((position.y+8)/16)*16-8
		if dir == PI and not collL.get_overlapping_bodies():
			movedir = dir
			animNum = 3
			position.y=round((position.y+8)/16)*16-8

func againstWall():
	if movedir == PI/-2 and collU.get_overlapping_bodies():
		return true
	if movedir == PI/2 and collD.get_overlapping_bodies():
		return true
	if movedir == 0 and collR.get_overlapping_bodies():
		return true
	if movedir == PI and collL.get_overlapping_bodies():
		return true
	return false
