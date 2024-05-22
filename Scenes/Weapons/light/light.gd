extends WeaponBasic
class_name LightPlayer


func _ready():
	pass
	#animationPlayer.play("idle")

func makeCurrent():
	FSM.change_state(null, "Idle")

func deactivateWeapon():
	FSM.change_state(null, "NotSelected")
