extends Node
class_name WeaponBasic


@onready var animationPlayer = $AnimationPlayer
@onready var FSM = $FiniteStateMachine


func makeCurrent():
	FSM.change_state(null, "Idle")

func deactivateWeapon():
	FSM.change_state(null, "NotSelected")


func attack():
	pass

func block():
	pass
