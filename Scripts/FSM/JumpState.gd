extends PlayerMovementState
class_name PlayerJump


#var doubleJump: bool

func Enter(previousState):
	print("jump acrivated doubleJump = ", doubleJump)
	speed = WALK_SPEED
	PLAYER.velocity.y += 5.5
	
	#	TODO weird change of double jump variable
	#doubleJump = false
	
	ANIMATIONPLAYER.pause()


func Exit():
	pass

func InputInState(event: InputEvent):
	if event.is_action_pressed("jump") and doubleJump == false:
		pass
	#	PLAYER.velocity.y = 4.5
	#	doubleJump = true
		
	
	#	jump strength
	if event.is_action_released("jump"):
		if PLAYER.velocity.y > 0:
			PLAYER.velocity.y = PLAYER.velocity.y / 2.0

func Update(_delta:float):
	if not PLAYER.is_on_floor():
		PLAYER.velocity.y -= gravity * _delta
		
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")
	var direction = (PLAYER.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	#fov
	var velocity_clamped = clamp(PLAYER.velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	CAMERA.fov = lerp(CAMERA.fov, target_fov, _delta * 8.0)


	PLAYER.move_and_slide()

	if PLAYER.velocity.y < -3.0 and !PLAYER.is_on_floor():
		state_transition.emit(self, "Falling")
	
	if PLAYER.is_on_floor():
		state_transition.emit(self, "idle")
