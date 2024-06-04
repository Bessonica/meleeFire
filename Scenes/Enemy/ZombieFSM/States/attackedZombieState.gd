extends ZombieState
class_name AttackedZombieState


func Enter(previousState):
	print("zombie got attacked")
	state_transition.emit(self, "Deactivated")
	


