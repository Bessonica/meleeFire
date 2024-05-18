extends Control

@onready var labelsContainer = $DebugPanel/MarginContainer/VBoxContainer

var debugLabels = {}

func _ready():
	visible = true

func _input(event):
	if event.is_action_pressed("debugPanel"):
		visible = !visible

func upsertDebugProperty(name: String, value: String):
	if not debugLabels.has(name):
		debugLabels[name] = Label.new()
		labelsContainer.add_child(debugLabels[name])
	debugLabels[name].text = name + ": " + value
