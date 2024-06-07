extends FiniteStateMachine
class_name FiniteStateMachineZombie


var target : Node

@onready var navigationAgent = $"../NavigationAgent3D"
@onready var animPlayer = $"../AnimationPlayer"
@onready var animTree = $"../AnimationTree"
@onready var stateLabel = $"../Label3D"
@onready var detectPlayerArea = $"../DetectPlayer"
@onready var mesh = $"../MeshInstance3D"

func _ready():
	super()
	for child in get_children():
		if child is ZombieState:
			child.setParamiters(navigationAgent, self, animPlayer, animTree, stateLabel, detectPlayerArea, mesh)


func setTarget(targetNode):
	print(targetNode.name)
	target = targetNode


