extends CharacterBody3D
class_name Player

func _process(delta):
	$DebugPanelInterface.upsertDebugProperty("FPS", "%.2f" % (1.0/delta))
	$DebugPanelInterface.upsertDebugProperty("State", $FiniteStateMachine.current_state.name.to_lower())

