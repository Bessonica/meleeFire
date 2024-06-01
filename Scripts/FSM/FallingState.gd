extends PlayerMovementState
class_name PlayerFalling





func Enter(previousState):
	speed = WALK_SPEED
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

	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")
	var direction = (PLAYER.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	PLAYER.velocity.x = lerp(PLAYER.velocity.x, direction.x * speed, _delta * 3.0)
	PLAYER.velocity.z = lerp(PLAYER.velocity.z, direction.z * speed, _delta * 3.0)
	
	#fov
	var velocity_clamped = clamp(PLAYER.velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	CAMERA.fov = lerp(CAMERA.fov, target_fov, _delta * 8.0)

	PLAYER.move_and_slide()
	
	if PLAYER.is_on_floor():
		state_transition.emit(self, "idle")
