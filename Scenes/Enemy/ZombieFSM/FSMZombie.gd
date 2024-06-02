extends FiniteStateMachine
class_name FiniteStateMachineZombie




func _ready():
	super()
	for child in get_children():
		if child is ZombieState:
			child.setParamiters()
