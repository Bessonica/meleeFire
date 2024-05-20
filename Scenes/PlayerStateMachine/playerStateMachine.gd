extends CharacterBody3D
class_name Player

@onready var weaponComponent = $Camera3D/WeaponComponentNode

const hitStagger = 5.5

func _process(delta):
	$DebugPanelInterface.upsertDebugProperty("FPS", "%.2f" % (1.0/delta))
	$DebugPanelInterface.upsertDebugProperty("State", $FiniteStateMachine.current_state.name.to_lower())
	$DebugPanelInterface.upsertDebugProperty("block area monitoring", var_to_str(weaponComponent.sword.blockArea.monitoring))
	$DebugPanelInterface.upsertDebugProperty("block area monitorable", var_to_str(weaponComponent.sword.blockArea.monitorable))

func hit(dir, isBlocked):
	if !var_to_str(weaponComponent.sword.blockArea.monitoring) == "true":
		print("got hit")
		print("isBlocked = ", isBlocked)
	if weaponComponent.sword.blockArea.has_overlapping_bodies():
		pass
	else:
		velocity += dir * hitStagger
		move_and_slide()
	


