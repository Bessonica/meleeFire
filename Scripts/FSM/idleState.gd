extends PlayerMovementState
class_name PlayerIdle



@onready var player = $"../.."
var desc = "hey"
#var gravity = 9.8


func Enter(previousState):
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#	MOUSE_MODE_VISIBLE
	#	MOUSE_MODE_CAPTURED
	isCurrent = true
	#doubleJump = false
	#animator.play("Idle")

func InputInState(event: InputEvent):	
	if event.is_action_pressed("Crouch") and PLAYER.is_on_floor():
		state_transition.emit(self, "Crouch")
	
	if event.is_action_pressed("jump") and PLAYER.is_on_floor():
		state_transition.emit(self, "Jump")
	
func Update(_delta : float):
	if not PLAYER.is_on_floor():
		state_transition.emit(self, "Moving")


	if(Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")):
		state_transition.emit(self, "Moving")
	
	if PLAYER.velocity.y < -3.0 and !PLAYER.is_on_floor():
		state_transition.emit(self, "Falling")

func Exit():
	isCurrent = false
