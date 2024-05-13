extends Node3D
class_name WeaponComponentNode

var weapons: Dictionary = {}
var currentWeapon
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is WeaponBasic:
			weapons[child.name.to_lower()] = child
	currentWeapon = weapons["sword"]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#	TODO 	check  _unhandled_key_input  function
func _unhandled_input(event):
	if event.is_action_pressed("attack"):
		print("attack")
		print(currentWeapon.name)

