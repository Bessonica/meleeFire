extends ZombieState
class_name IdleZombieState





func _on_detect_player_body_entered(body):
	FSM.setTarget(body)
	state_transition.emit(self, "Follow")



