extends PlayerMovementState
class_name PlayerCrouch

@export_range(1, 6, 0.1) var crouchSpeed : float = 4.0

func Enter():
	speed = WALK_SPEED
	print("hey")
	ANIMATIONPLAYER.play('Crouch', -1.0, crouchSpeed)
	
func Exit():
	pass
	#ANIMATIONPLAYER.play('StandUp', -1.0, crouchSpeed)
	
func Update(_delta:float):
	if not PLAYER.is_on_floor():
		PLAYER.velocity.y -= gravity * _delta
		
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")
	var direction = (PLAYER.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if PLAYER.is_on_floor():
		if direction:
			PLAYER.velocity.x = direction.x * speed
			PLAYER.velocity.z = direction.z * speed
		else:
			PLAYER.velocity.x = lerp(PLAYER.velocity.x, direction.x * speed, _delta * 7.0)
			PLAYER.velocity.z = lerp(PLAYER.velocity.z, direction.z * speed, _delta * 7.0)
	else:
		PLAYER.velocity.x = lerp(PLAYER.velocity.x, direction.x * speed, _delta * 3.0)
		PLAYER.velocity.z = lerp(PLAYER.velocity.z, direction.z * speed, _delta * 3.0)
	
	
	t_bob += _delta * PLAYER.velocity.length() * float(PLAYER.is_on_floor())
	#CAMERA.transform.origin = _headbob(t_bob)

	#fov
	var velocity_clamped = clamp(PLAYER.velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	CAMERA.fov = lerp(CAMERA.fov, target_fov, _delta * 8.0)
	
#	if PLAYER.velocity < Vector3(0.004, 0.004, 0.004):
#		state_transition.emit(self, "idle")

	PLAYER.move_and_slide()

func Unhandled_input(event: InputEvent):
	super(event)
	if event.is_action_released("Crouch"):
		state_transition.emit(self, "idle")

func InputInState(event: InputEvent):
	pass
