extends CharacterBody3D


var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0
const WHILE_ATTACK_SPEED = 3.0
const JUMP_VELOCITY = 4.5
const sensitivity = 0.01
const hitStagger = 5.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8

const BOB_FREQ = 2.4
const BOB_AMP = 0.08
var t_bob = 0.0

signal playerHit

var blockState = false 

@export var health : int = 20.0

@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var animationPlayer = $AnimationPlayer
@onready var hitbox = $"Head/Camera3D/WeaponPivot/Weapon mesh/Hitbox"
@onready var cameraRaycast = $Head/Camera3D/RayCast3D


const BASE_FOV = 75.0
const FOV_CHANGE = 1.25


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		#head.rotate_y	or	rotate_y	????
		rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))


func _process(delta):
	if Input.is_action_just_pressed("attack"):
		animationPlayer.play("attack")
		speed = WHILE_ATTACK_SPEED
		hitbox.monitoring = true
	if Input.is_action_just_pressed("block"):
		animationPlayer.play("block")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	
	if Input.is_action_pressed("sprint"):
		if animationPlayer.current_animation == "idle":
			speed = SPRINT_SPEED
	else:
		if animationPlayer.current_animation == "idle":
			speed = WALK_SPEED
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		#if direction:
			#velocity.x = direction.x * speed
			#velocity.z = direction.z * speed
		#else:
			#velocity.x = 0.0
			#velocity.z = 0.0
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
	
	
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)

	#fov
	var velocity_clamped = clamp(velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)


	move_and_slide()



func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
	


func hit(dir):
	if blockState == true:
		print("blocked")
	else:
		print("not blocked")
	
	if animationPlayer.current_animation == "idle":
		emit_signal("playerHit")
		velocity += dir * hitStagger
	if animationPlayer.current_animation == "block":
		pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":
		animationPlayer.play("idle")
		hitbox.monitoring = false
	if anim_name == "block":
		animationPlayer.play("idle")

func blockStart():
	blockState = true

func blockEnd():
	blockState = false

func _on_hitbox_body_entered(body):
	print(typeof(body))
	body.gotHit()

func ballTouched(ball):
	if blockState == true:
		var newVector = - camera.get_global_transform().basis.z
		ball.changeVector(newVector)
	else:
		hit(ball.global_position.direction_to(self.global_position))
	
	
