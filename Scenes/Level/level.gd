extends Node3D


@onready var colorRect = $Ui/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_player_hit():
	colorRect.visible = true
	await get_tree().create_timer(0.2).timeout
	colorRect.visible = false
	
