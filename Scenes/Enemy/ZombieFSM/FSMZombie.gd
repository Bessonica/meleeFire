extends FiniteStateMachine
class_name FiniteStateMachineZombie


var target : Node

@onready var navigationAgent = $"../NavigationAgent3D"

func _ready():
	super()
	for child in get_children():
		if child is ZombieState:
			child.setParamiters(navigationAgent, self)


func setTarget(targetNode):
	print(targetNode.name)
	target = targetNode
