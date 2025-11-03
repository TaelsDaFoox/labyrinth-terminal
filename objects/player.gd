extends CharacterBody3D
@onready var camera = $Camera3D
@export var move_speed :=10
@export var mouse_sensitivity:=0.005
@onready var flashlight = $SpotLight3D
var enemyasset = load("res://objects/spooky_guy.tscn")
var enemynesasset = load("res://objects/NESenemy.tscn")
@onready var enemytimer=$EnemySpawnTimer
var spook = load("res://spooky.tscn")
func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left","right","forward","backward")
	input_dir = input_dir.rotated(-camera.rotation.y)
	if Global.controllingGame:
		input_dir=Vector2.ZERO
	velocity.x=input_dir.x*move_speed
	velocity.z=input_dir.y*move_speed
	move_and_slide()
	flashlight.rotation.y = lerp_angle(flashlight.rotation.y,camera.rotation.y,delta*10)
	flashlight.rotation.x = lerp_angle(flashlight.rotation.x,camera.rotation.x,delta*10)
	Global.playerpos=global_position
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("lock mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("unlock mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		camera.rotation.y-=event.relative.x*mouse_sensitivity
		camera.rotation.x-=event.relative.y*mouse_sensitivity
func _on_enemy_spawn_timer_timeout() -> void:
	var enemyspawn = enemyasset.instantiate()
	var randomangle = randf_range(0,2*PI)
	enemyspawn.position.x = sin(randomangle)*50
	enemyspawn.position.z = cos(randomangle)*50
	get_parent().add_child(enemyspawn)
	var nesenemyspawn = enemynesasset.instantiate()
	get_parent().get_node("SubViewport").add_child(nesenemyspawn)
	enemyspawn.nesenemy=nesenemyspawn
	nesenemyspawn.targetObj = enemyspawn


func _on_die_body_entered(body: Node3D) -> void:
	Global.initializeVars()
	get_tree().change_scene_to_packed(spook)
	#get_tree().reload_current_scene()
