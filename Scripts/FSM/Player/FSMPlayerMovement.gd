extends FiniteStateMachine
class_name FiniteStateMachinePlayerMovement

@onready var playerCamera = $"../Camera3D"
@onready var player = $".."
@onready var animationPlayer = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	for child in get_children():
		if child is PlayerState:
			child.setParamiters(playerCamera, player, animationPlayer)
	


