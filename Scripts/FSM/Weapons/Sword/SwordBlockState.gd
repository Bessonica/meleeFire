extends WeaponBasicState
class_name SwordBlockState

func Enter(previousState):
	animationPlayer.play("Block")
	print("entered block")
	activateArea(blockArea)


func Exit():
	deActivateArea(blockArea)


func InputInState(event: InputEvent):
	pass
#	if event.is_action_pressed("attack"):
#		state_transition.emit(self, "Attack")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Block":
		state_transition.emit(self, "Idle")
		#deActivateArea(attackArea)


func _on_block_area_body_entered(body):
	pass # Replace with function body.
