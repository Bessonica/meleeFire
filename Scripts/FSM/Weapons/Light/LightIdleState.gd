extends WeaponBasicState
class_name LightIdleState



func Enter(previousState):
	print("light yo")
	animationPlayer.play("idle")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
