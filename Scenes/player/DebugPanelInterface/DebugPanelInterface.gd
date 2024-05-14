extends Control

@onready var propertyContainer = $DebugPanel/MarginContainer/VBoxContainer

@export var FSM : FiniteStateMachine

var property
var currentStateProperty : String

var framesPerSecond: String
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	addDebugProperty("FPS", framesPerSecond)
	addDebugProperty("State", currentStateProperty)

func _input(event):
	if event.is_action_pressed("debugPanel"):
		visible = !visible


func addDebugProperty(title : String, value):
	property = Label.new()
	propertyContainer.add_child(property)
	property.name = title
	property.text = property.name + " " + value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		#	TODO dont understand how framesPerSecond updates on screen, we have one property var for all data
		framesPerSecond = "%.2f" % (1.0/delta)
		property.text = property.name + ": " + framesPerSecond
		
		currentStateProperty = FSM.current_state.name.to_lower()
		property.text = property.name + ": " + currentStateProperty





