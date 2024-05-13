extends PlayerMovementState
class_name PlayerMove

@onready var player = $"../.."
#@onready var camera = $"../../Camera3D"


#const sensitivity = 0.01

# Called when the node enters the scene tree for the first time.
func Enter(previousState):
	speed = WALK_SPEED
	isCurrent = true
	
func Exit():
	isCurrent = false

func _unhandled_input(event):
	pass
	#if isCurrent:
		#if event is InputEventMouseMotion:
		#	#head.rotate_y	or	rotate_y	????
		#	PLAYER.rotate_y(-event.relative.x * sensitivity)
		#	camera.rotate_x(-event.relative.y * sensitivity)
		#	camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))



func InputInState(event: InputEvent):	
	if event.is_action_pressed("sprint") and PLAYER.is_on_floor():
		state_transition.emit(self, "Sprint")
	#if event.is_pressed()
	if event.is_action_pressed("Crouch") and PLAYER.is_on_floor():
		state_transition.emit(self, "Crouch")
	
	if event.is_action_pressed("jump") and PLAYER.is_on_floor():
		state_transition.emit(self, "Jump")
	
func _input(event):
	pass


func Update(_delta:float):
	#	InputInState isnt called when you hold button from previous state
	if Input.is_action_pressed("sprint") and PLAYER.is_on_floor():
		state_transition.emit(self, "Sprint")
	
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
	

	if PLAYER.velocity < Vector3(0.004, 0.004, 0.004) and PLAYER.velocity > Vector3(-0.004, -0.004, -0.004):
		state_transition.emit(self, "idle")

	PLAYER.move_and_slide()

	#	TODO when stateTransition from crouch to walk _headbob creates camera jump in the begining

func _headbob(time) -> Vector3:
	return Vector3(0,0,0)
	pass
	#var pos = Vector3.ZERO
	#pos.y = sin(time * BOB_FREQ) * BOB_AMP
	#pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	#return pos
