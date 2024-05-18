extends WeaponBasic
class_name Sword


@onready var animationPlayer = $AnimationPlayer
@onready var attackArea = $AttackArea
@onready var blockArea = $BlockArea

# Called when the node enters the scene tree for the first time.
func _ready():
	attackArea.monitorable = false
	attackArea.monitoring = false
	
	blockArea.monitorable = false
	blockArea.monitoring = false
	#await get_tree().create_timer(5.0).timeout
	#animationPlayer.play("Idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func attack():
	attackArea.monitoring = true
	animationPlayer.play("Attack")

func block():
	animationPlayer.play("Block")
	blockArea.monitoring = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Attack":
		animationPlayer.play("Idle")
		attackArea.monitoring = false
	if anim_name == "Block":
		animationPlayer.play("Idle")
		blockArea.monitoring = false


func _on_attack_area_body_entered(body):
	body.gotHit()
