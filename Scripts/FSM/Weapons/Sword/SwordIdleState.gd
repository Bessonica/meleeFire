extends WeaponBasicState
class_name SwordIdleState

# Called when the node enters the scene tree for the first time.
func Enter(previousState):
	animationPlayer.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
