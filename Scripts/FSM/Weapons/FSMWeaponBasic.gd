extends FiniteStateMachine
class_name FiniteStateMachineWeaponBasic


@onready var weaponAnimationPlayer = $"../AnimationPlayer"
@onready var attackArea = $"../AttackArea"
@onready var blockArea = $"../BlockArea"

var isCurrentWeapon: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	for child in get_children():
		if child is WeaponBasicState:
			child.setParamiters(weaponAnimationPlayer, attackArea, blockArea)


