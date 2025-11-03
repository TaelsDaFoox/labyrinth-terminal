extends Node
var playerpos: Vector3 = Vector3.ZERO
var inControlRange = false
var controllingGame = false
var power := 100.0
var monitorOn = true
var gameEnergyDrainSpeed = 1.0
func _process(delta: float) -> void:
	if monitorOn:
		power-=gameEnergyDrainSpeed*delta
