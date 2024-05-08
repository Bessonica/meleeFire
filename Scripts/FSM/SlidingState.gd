extends PlayerMovementState
class_name PlayerSliding


@export var slideSpeed: float = 6.0
@export var acceleration: float = 0.1
@export var deAceleration: float = 0.25
@export var tiltAmount: float = 0.09
@export_range(1, 6, 0.1) var slideAnimSpeed: float = 4.0


func Enter(previousState):
	speed = SPRINT_SPEED
	#setTilt(PLAYER._current_rotation)
	ANIMATIONPLAYER.get_animation("Sliding").track_set_key_value(4, 0, PLAYER.velocity.length())
	ANIMATIONPLAYER.speed_scale = 1.0
	ANIMATIONPLAYER.play("Sliding", -1.0, slideAnimSpeed)
	#print(ANIMATIONPLAYER.get_animation("Sliding").track_get_path(0))

func Exit():
	pass
	#ANIMATIONPLAYER.stop()



	# 0 - 7
#CollisionShape3D:shape:height
#CollisionShape3D:position
#Camera3D:position
#Camera3D:rotation
#RayCast3D:position
#FiniteStateMachine/Slide:slideSpeed
#FiniteStateMachine/Slide
#Camera3D:fov
#	TODO this function tilts camera left or right, player rotation you can find in beginning of episode
#		about sliding
func setTilt(playerRotation):
	var tilt = Vector3.ZERO
	tilt.z = clamp(tiltAmount * playerRotation, -0.1, 0.1)
	if tilt.z == 0:
		tilt.z = 0.05
	ANIMATIONPLAYER.get_animation("Sliding").track_set_key_value(0, 1, tilt)
	ANIMATIONPLAYER.get_animation("Sliding").track_set_key_value(0, 2, tilt)

func finish():
	state_transition.emit(self, "Crouch")

func Update(_delta:float):
	if Input.is_action_just_released("Crouch"):
		finish()
	
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
