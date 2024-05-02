extends PlayerState
class_name PlayerMovementState



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		#head.rotate_y	or	rotate_y	????
		PLAYER.rotate_y(-event.relative.x * sensitivity)
		CAMERA.rotate_x(-event.relative.y * sensitivity)
		CAMERA.rotation.x = clamp(CAMERA.rotation.x, deg_to_rad(-40), deg_to_rad(60))
