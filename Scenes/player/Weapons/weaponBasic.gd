extends Node
class_name WeaponBasic


@onready var animationPlayer = $AnimationPlayer
@onready var FSM = $FiniteStateMachine

@onready var attackArea = $AttackArea
@onready var blockArea = $BlockArea

func makeCurrent():
	FSM.change_state(FSM.current_state, "Idle")

func deactivateWeapon():
	FSM.change_state(FSM.current_state, "NotSelected")


func attack():
	pass

func block():
	pass
