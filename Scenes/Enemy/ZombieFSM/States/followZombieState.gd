extends ZombieState
class_name FollowZombieState

@onready var ZombieFSM = $"../.."
const speed = 2.0

func Enter(previousState):
	print("notised player")



func Update(_delta):
	navigationAgent.set_target_position(FSM.target.global_transform.origin)
	
	var nextNavPoint = navigationAgent.get_next_path_position()
	ZombieFSM.velocity = (nextNavPoint - ZombieFSM.global_transform.origin).normalized() * speed
	ZombieFSM.move_and_slide()
