extends WeaponBasicState
class_name SwordAttackState


func Enter(previousState):
	animationPlayer.play("Attack")
	print("entered attack")
	activateArea(attackArea)


func Exit():
	deActivateArea(attackArea)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Attack":
		state_transition.emit(self, "Idle")
		deActivateArea(attackArea)

