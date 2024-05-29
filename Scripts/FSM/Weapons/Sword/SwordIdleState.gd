extends WeaponBasicState
class_name SwordIdleState

# Called when the node enters the scene tree for the first time.
func Enter(previousState):
	animationPlayer.play("Idle")
	#print("in idle sword")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func InputInState(event: InputEvent):
	if event.is_action_pressed("attack"):
		state_transition.emit(self, "Attack")
	if event.is_action_pressed("block"):
		state_transition.emit(self, "Block")
