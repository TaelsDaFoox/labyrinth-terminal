extends Node
var playerpos: Vector3 = Vector3.ZERO
var inControlRange = false
var controllingGame = false
var power := 100.0
var monitorOn = true
var gameEnergyDrainSpeed = 3.0
var holdingBattery = false
var inBatteryRange = false
var timer := 0.0
signal robotInput()
func _process(delta: float) -> void:
	if monitorOn:
		power-=gameEnergyDrainSpeed*delta
	power = clampf(power,0.0,100.0)
	if power <=0.0:
		monitorOn=false
	timer+=delta

func initializeVars():
	controllingGame=false
	power=100.0
	monitorOn=true
	holdingBattery=false
	timer=0.0
func emitRobotInput():
	robotInput.emit()
