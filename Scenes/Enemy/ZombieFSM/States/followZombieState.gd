extends ZombieState
class_name FollowZombieState

@onready var ZombieFSM = $"../.."
const speed = 2.0


func Enter(previousState):
	
	animTree.set("parameters/conditions/targetInFocus", true)



func Update(_delta):
	navigationAgent.set_target_position(FSM.target.global_transform.origin)
	
	
	var nextNavPoint = navigationAgent.get_next_path_position()
	ZombieFSM.velocity = (nextNavPoint - ZombieFSM.global_transform.origin).normalized() * speed
	ZombieFSM.look_at(Vector3(ZombieFSM.global_position.x + ZombieFSM.velocity.x, ZombieFSM.global_position.y, ZombieFSM.global_position.z + ZombieFSM.velocity.z), Vector3.UP)
	ZombieFSM.move_and_slide()
