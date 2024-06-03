extends State
class_name ZombieState

@onready var navigationAgent : NavigationAgent3D
@onready var FSM : FiniteStateMachineZombie 


func setParamiters(navigationAgent, FSM):
	self.navigationAgent = navigationAgent
	self.FSM = FSM

