extends PlayerMovementState
class_name PlayerFalling





func Enter(previousState):
	
	print("fallins state entered doubleJump = ", doubleJump)
	pass
	#doubleJump = false

func InputInState(event: InputEvent):
	if event.is_action_pressed("jump") and doubleJump == false:
		PLAYER.velocity.y = 4.5
		doubleJump = true

func Update(_delta:float):
	if not PLAYER.is_on_floor():
		PLAYER.velocity.y -= gravity * _delta

	#fov
	var velocity_clamped = clamp(PLAYER.velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	CAMERA.fov = lerp(CAMERA.fov, target_fov, _delta * 8.0)

	PLAYER.move_and_slide()
	
	if PLAYER.is_on_floor():
		state_transition.emit(self, "idle")
