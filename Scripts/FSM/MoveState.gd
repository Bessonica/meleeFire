extends PlayerMovementState
class_name PlayerMove

@onready var player = $"../.."
@onready var camera = $"../../Camera3D"

var gravity = 9.8
var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0


const BOB_FREQ = 2.4
const BOB_AMP = 0.065
var t_bob = 0.0

const BASE_FOV = 75.0
const FOV_CHANGE = 0.7

const sensitivity = 0.01

# Called when the node enters the scene tree for the first time.
func Enter():
	print("state moving")
	speed = WALK_SPEED
	isCurrent = true
	
func Exit():
	isCurrent = false

func _unhandled_input(event):
	if isCurrent:
		if event is InputEventMouseMotion:
			#head.rotate_y	or	rotate_y	????
			PLAYER.rotate_y(-event.relative.x * sensitivity)
			camera.rotate_x(-event.relative.y * sensitivity)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _input(event):
	if isCurrent:
		if event.is_action_pressed("sprint"):
			print("sprint change")
			state_transition.emit(self, "Sprint")
	else:
		pass

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
	camera.transform.origin = _headbob(t_bob)

	#fov
	var velocity_clamped = clamp(PLAYER.velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, _delta * 8.0)


	PLAYER.move_and_slide()

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
