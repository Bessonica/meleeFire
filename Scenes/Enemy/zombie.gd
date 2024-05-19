extends CharacterBody3D


var player = null
const speed = 2.0
const attackRange = 2.5
var stateMachine

const colorDefault = "ec958c"
const colorRed = "d73643"

@export var activated : bool
@export var playerPath : NodePath
@export var health : int = 10

@onready var navAgent = $NavigationAgent3D
@onready var animTree = $AnimationTree

@onready var meshSurface = $zombie/Armature/Skeleton3D/Beta_Surface

@onready var attackArea = $AttackArea3D
#default		ec958c
#red	d73643

func _ready():
	player = get_node(playerPath)
	stateMachine = animTree.get("parameters/playback")
	attackArea.monitoring = true

func _process(delta):
	if !activated:
		return
	
	
	velocity = Vector3.ZERO
	
	match stateMachine.get_current_node():
		"Run":
			navAgent.set_target_position(player.global_transform.origin)
			var nextNavPoint = navAgent.get_next_path_position()
			velocity = (nextNavPoint - global_transform.origin).normalized() * speed
			look_at(Vector3(global_position.x + velocity.x, global_position.y, global_position.z + velocity.z), Vector3.UP)
		"Attack":
			look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
		"Stunned":
			pass
	
	
	
	
	animTree.set("parameters/conditions/attack", targetInRange())
	animTree.set("parameters/conditions/run", !targetInRange())
	
	move_and_slide()

func _physics_process(delta):
	if attackArea.has_overlapping_areas():
		print("block")

func targetInRange():
	return global_position.distance_to(player.global_position) < attackRange

func hitFinished():
	if global_position.distance_to(player.global_position) <= attackRange + 1.0:
		attackArea.monitoring = true
		var dir = global_position.direction_to(player.global_position)
		if !attackArea.has_overlapping_areas():
			if player.has_method("hit"):
				player.hit(dir)
	
	attackArea.monitoring = false

func gotHit():
	switchColor()

func changeColor(color):
	var meshMaterial = meshSurface.mesh.surface_get_material(0)
	meshMaterial.albedo_color = Color(color)
	meshSurface.mesh.surface_set_material(0, meshMaterial)


func switchColor():
	var meshMaterial = meshSurface.mesh.surface_get_material(0)
	if meshMaterial.albedo_color == Color(colorRed):
		changeColor(colorDefault)
	else:
		changeColor(colorRed)



func _on_attack_area_3d_area_entered(area):
	pass # Replace with function body.
