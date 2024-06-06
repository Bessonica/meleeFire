extends ZombieState
class_name IdleZombieState


func Enter(previousState):
	pass
	#animTree.set("parameters/conditions/inIdle", true)



func _on_detect_player_body_entered(body):
	FSM.setTarget(body)
	state_transition.emit(self, "Follow")



