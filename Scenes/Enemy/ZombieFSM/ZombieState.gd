extends State
class_name ZombieState

@onready var navigationAgent : NavigationAgent3D
@onready var FSM : FiniteStateMachineZombie 
@onready var animPlayer : AnimationPlayer
@onready var animTree : AnimationTree

func setParamiters(navigationAgent, FSM, animPlayer, animTree):
	self.navigationAgent = navigationAgent
	self.FSM = FSM
	self.animPlayer = animPlayer
	self.animTree = animTree

