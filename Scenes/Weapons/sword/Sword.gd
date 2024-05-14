extends WeaponBasic
class_name Sword


@onready var animationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#await get_tree().create_timer(5.0).timeout
	#animationPlayer.play("Idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func attack():
	animationPlayer.play("Attack")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Attack":
		animationPlayer.play("Idle")
	else:
		pass
