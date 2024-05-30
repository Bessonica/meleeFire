extends WeaponBasic
class_name SwordPlayer


#@onready var animationPlayer = $AnimationPlayer




var isIdle : bool
# Called when the node enters the scene tree for the first time.


func _ready():
	if animationPlayer.current_animation == "Idle":
		isIdle = true
	#await get_tree().create_timer(5.0).timeout



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func attack():
	pass


func block():
	pass


func _on_animation_player_animation_finished(anim_name):
	pass


func _on_block_area_area_entered(area):
	pass
	#print("there is block")

