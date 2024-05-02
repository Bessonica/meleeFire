extends PlayerMovementState
class_name PlayerIdle

@export var animator : AnimationPlayer

@onready var player = $"../.."
var desc = "hey"
var gravity = 9.8


func Enter():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	isCurrent = true
	#animator.play("Idle")
	
	
func Update(_delta : float):
	if not PLAYER.is_on_floor():
		state_transition.emit(self, "Moving")

	
	if(Input.get_vector("moveLeft", "moveRIght", "moveForward", "moveBackward")):
		state_transition.emit(self, "Moving")
	

func Exit():
	isCurrent = false
