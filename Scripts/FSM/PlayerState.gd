extends State
class_name PlayerState

# uppercase = const
@onready var PLAYER : Player
var CAMERA
const sensitivity = 0.01
# Called when the node enters the scene tree for the first time.
func _ready():
	await owner.ready
	PLAYER = owner as Player

func setParamiters(camera: Camera3D):
	self.CAMERA = camera
