extends State
class_name WeaponBasicState


@onready var animationPlayer
@onready var attackArea
@onready var blockArea


func setParamiters(animationPlayer, attackArea, blockArea):
	self.animationPlayer = animationPlayer
	self.attackArea = attackArea
	self.blockArea = blockArea


func deActivateArea(area):
	area.monitoring = false
	area.monitorable = false

func activateArea(area):
	blockArea.monitoring = true
	blockArea.monitorable = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
