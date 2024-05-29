extends WeaponBasic
class_name SwordPlayer


#@onready var animationPlayer = $AnimationPlayer




var isIdle : bool
# Called when the node enters the scene tree for the first time.


func _ready():
	attackArea.monitorable = false
	attackArea.monitoring = false
	
	blockArea.monitorable = false
	blockArea.monitoring = false
	
	#activateArea(blockArea)
	
	if animationPlayer.current_animation == "Idle":
		isIdle = true
	#await get_tree().create_timer(5.0).timeout
	#animationPlayer.play("Idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if blockArea.has_overlapping_bodies():
	#	print("zombie")


func attack():
	pass
	#FSM.change_state(FSM.current_state, "Attack")
	#if isIdle:
		#activateArea(attackArea)
		#animationPlayer.play("Attack")
		#isIdle = false

func block():
	pass
	#if isIdle:
	#	animationPlayer.play("Block")
	#	activateArea(blockArea)
	#	isIdle = false

func _on_animation_player_animation_finished(anim_name):
	pass
#	if anim_name == "Attack":
#		animationPlayer.play("Idle")
#		isIdle = true
#		#deActivateArea(attackArea)
#	if anim_name == "Block":
#		animationPlayer.play("Idle")
#		isIdle = true
#		deActivateArea(blockArea)


func deActivateArea(area):
	area.monitoring = false
	area.monitorable = false

func activateArea(area):
	blockArea.monitoring = true
	blockArea.monitorable = true


func _on_attack_area_body_entered(body):
	body.gotHit()
	
	


func _on_block_area_area_entered(area):
	pass
	#print("there is block")


func _on_block_area_body_entered(body):
	print("there is zombie")
