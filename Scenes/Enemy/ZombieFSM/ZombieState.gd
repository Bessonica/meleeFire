extends State
class_name ZombieState

@onready var navigationAgent : NavigationAgent3D
@onready var FSM : FiniteStateMachineZombie 
@onready var animPlayer : AnimationPlayer
@onready var animTree : AnimationTree
@onready var stateLabel : Label3D
@onready var detectPlayerArea : Area3D
@onready var mesh : MeshInstance3D

func setParamiters(navigationAgent, FSM, animPlayer, animTree, stateLabel, detectPlayerArea, mesh):
	self.navigationAgent = navigationAgent
	self.FSM = FSM
	self.animPlayer = animPlayer
	self.animTree = animTree
	self.stateLabel = stateLabel
	self.detectPlayerArea = detectPlayerArea
	self.mesh = mesh

