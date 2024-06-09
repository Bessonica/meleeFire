extends ZombieState
class_name DeactivatedZombieState


#func _on_hit_box_area_area_entered(area):
	#print("attacked")
#	state_transition.emit(self, "Idle")

func Enter(previousState):
	print("in deactivated")


func Update(_delta):
	stateLabel.text = self.name
