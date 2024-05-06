extends FiniteStateMachine
class_name FiniteStateMachinePlayerMovement

@onready var playerCamera = $"../Camera3D"
@onready var player = $".."
@onready var animationPlayer = $"../AnimationPlayer"
@onready var SHAPECAST3D = $"../ShapeCast3D"
@onready var RAYCAST3D = $"../RayCast3D"
# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	for child in get_children():
		if child is PlayerState:
			child.setParamiters(playerCamera, player, animationPlayer, RAYCAST3D)
	


