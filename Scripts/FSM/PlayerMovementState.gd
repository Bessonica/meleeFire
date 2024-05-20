extends PlayerState
class_name PlayerMovementState

var gravity = 9.8
var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0


const BOB_FREQ = 2.4
const BOB_AMP = 0.065
var t_bob = 0.0

const BASE_FOV = 75.0
const FOV_CHANGE = 0.7

var doubleJump: bool = false
#	set(value):
#		print("double jump changed = ", value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		#head.rotate_y	or	rotate_y	????
		PLAYER.rotate_y(-event.relative.x * sensitivity)
		CAMERA.rotate_x(-event.relative.y * sensitivity)
		CAMERA.rotation.x = clamp(CAMERA.rotation.x, deg_to_rad(-40), deg_to_rad(60))



