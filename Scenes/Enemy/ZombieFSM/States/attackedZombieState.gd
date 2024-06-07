extends ZombieState
class_name AttackedZombieState


func Enter(previousState):
	print("zombie got attacked")
	#state_transition.emit(self, "Deactivated")
	animTree.set("parameters/conditions/isAttacked", true)
	
	var meshMaterial = mesh.mesh.surface_get_material(0)
	meshMaterial.albedo_color = Color.RED
	mesh.mesh.surface_set_material(0, meshMaterial)
	
func Exit():
	var meshMaterial = mesh.mesh.surface_get_material(0)
	meshMaterial.albedo_color = Color.WHITE
	mesh.mesh.surface_set_material(0, meshMaterial)

func Update(_delta):
	stateLabel.text = self.name
	await get_tree().create_timer(1.0).timeout
	animTree.set("parameters/conditions/isAttacked", false)
	state_transition.emit(self, "idle")
	


