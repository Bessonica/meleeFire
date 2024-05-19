extends Node3D
class_name WeaponComponentNode

var weapons: Dictionary = {}
var currentWeapon

var blockStatus

@onready var sword = $Sword

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is WeaponBasic:
			weapons[child.name.to_lower()] = child
			child.visible = false
			
	currentWeapon = weapons["sword"]
	print(weapons.keys())
	currentWeapon.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#	TODO 	check  _unhandled_key_input  function
func _unhandled_input(event):
	if event.is_action_pressed("attack"):
		currentWeapon.attack()
	if event.is_action_pressed("block"):
		currentWeapon.block()

