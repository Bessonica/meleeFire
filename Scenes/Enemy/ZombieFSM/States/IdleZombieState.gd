extends ZombieState
class_name IdleZombieState

# state transition doesnt work in enter function why	TODO
func Enter(previousState):
	print("in idle")
	animTree.set("parameters/conditions/inIdle", true)




func _on_detect_player_body_entered(body):
	FSM.setTarget(body)
	state_transition.emit(self, "Follow")



func Update(_delta):
	stateLabel.text = self.name
	if detectPlayerArea.has_overlapping_bodies():
		state_transition.emit(self, "Follow")
