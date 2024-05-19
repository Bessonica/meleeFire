extends CharacterBody3D
class_name Player

@onready var weaponComponent = $Camera3D/WeaponComponentNode


func _process(delta):
	$DebugPanelInterface.upsertDebugProperty("FPS", "%.2f" % (1.0/delta))
	$DebugPanelInterface.upsertDebugProperty("State", $FiniteStateMachine.current_state.name.to_lower())

func hit(dir):
	print("got hit")
