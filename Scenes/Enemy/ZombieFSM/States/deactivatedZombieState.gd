extends ZombieState
class_name DeactivatedZombieState


func _on_hit_box_area_area_entered(area):
	state_transition.emit(self, "Idle")

func Enter(previousState):
	print("in deactivated")
