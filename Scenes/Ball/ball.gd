extends Area3D


var SPEED = 15.0
var movementVector

# Called when the node enters the scene tree for the first time.
func _ready():
	movementVector = Vector3(0, 0, -SPEED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.basis * movementVector * delta


func changeVector(newVector):
	movementVector =  newVector * SPEED
	

func redirect():
	pass

func _on_body_entered(body):
	if body.has_method("ballTouched"):
		body.ballTouched(self)
