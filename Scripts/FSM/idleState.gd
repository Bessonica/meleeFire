extends PlayerMovementState
class_name PlayerIdle



@onready var player = $"../.."
var desc = "hey"
#var gravity = 9.8


func Enter():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	isCurrent = true
	#animator.play("Idle")

func InputInState(event: InputEvent):	
	if event.is_action_pressed("Crouch"):
		state_transition.emit(self, "Crouch")
	
func Update(_delta : float):
	if not PLAYER.is_on_floor():
		state_transition.emit(self, "Moving")


	if(Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")):
		state_transition.emit(self, "Moving")
	
	

func Exit():
	isCurrent = false
