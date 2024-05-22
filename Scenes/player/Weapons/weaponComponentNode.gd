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
			child.deactivateWeapon()
			child.visible = false
			
	currentWeapon = weapons["sword"]
	currentWeapon.makeCurrent()
	#print(weapons.keys())
	currentWeapon.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("changeWeapon"):
		if currentWeapon == weapons["sword"]:
			changeCurrentWeapon("light")
		else:
			changeCurrentWeapon("sword")




#	TODO
# deactivate old weapon (exit function)
# activate new weapon (enter function)
func changeCurrentWeapon(name: String):
	currentWeapon.visible = false
	name = name.to_lower()
	currentWeapon.deactivateWeapon()
	currentWeapon = weapons[name]
	currentWeapon.makeCurrent()
	currentWeapon.visible = true



#	TODO 	check  _unhandled_key_input  function
func _unhandled_input(event):
	if event.is_action_pressed("attack"):
		currentWeapon.attack()
	if event.is_action_pressed("block"):
		currentWeapon.block()

