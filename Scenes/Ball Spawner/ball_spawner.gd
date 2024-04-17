extends Node3D



var ball = load("res://Scenes/Ball/ball.tscn")
var ballInstance

@onready var spawnerRaycast = $RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func spawnBall():
	ballInstance = ball.instantiate()
	ballInstance.position = spawnerRaycast.global_position
	ballInstance.transform.basis = spawnerRaycast.global_transform.basis
	get_parent().add_child(ballInstance)
	


func _on_timer_timeout():
	spawnBall()
