extends KinematicBody2D

var follow_player := false
var speed = 100
var velocity = Vector2.ZERO
export var interaction_room = 0
var dialogueCounter = 0
var dialogueTotal = 0
onready var dialogue = get_parent().get_node("UI/CanvasLayer/PopupDialog")
onready var player = get_parent().get_node("Player")
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	if follow_player == true:
		var dir = (player.global_position - global_position).normalized()
		move_and_collide(dir * speed * delta)
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
		input_vector = input_vector.normalized()
		
		if input_vector != Vector2.ZERO:
			animationTree.set("parameters/Idle/blend_position", input_vector)
			animationTree.set("parameters/Walk/blend_position", input_vector)
			animationState.travel("Walk")
		else:
			animationState.travel("Idle")

func interaction():
	print("Is interacting with " + self.name)
	dialogue()

func follow():
	follow_player = true


func dialogue():
	if interaction_room == 0:
		bedroom()
	if interaction_room == 1:
		bathroom()
	if interaction_room == 2:
		office()
	if interaction_room == 3:
		living_room()
	if interaction_room == 4:
		kitchen()
	if interaction_room == 5:
		hallway()
		

func bedroom():
	var interaction_Counter = 0
	dialogueTotal = 4
	if dialogueCounter == 0:
		dialogue.dialogue = "A visitor..? From the mortal plane no less!"
		dialogue.open(self.get_path())
	if dialogueCounter == 1:
		dialogue.dialogue = "Not common to see humans around here. Are you lost?"
		dialogue.open(self.get_path())
	if dialogueCounter == 2:
		dialogue.dialogue = "Don't worry human. I can show you how to navigate \n The Astral Plane."
		dialogue.open(self.get_path())
	if dialogueCounter == 3:
		dialogue.dialogue = "Let's make a game of it! Beside me if your book shelf. \n Your first clue waits for you there."
		dialogue.open(self.get_path())
		Global.scavengerHuntLevel = 1
		Global.scavengerHuntStage = 1
	if dialogueCounter == 4:
		dialogue.dialogue = "Take your time human, there's no such thing here."
		interaction_Counter = 1
	if interaction_Counter == 1:
		if Global.scavengerHuntStage == 5:
			dialogue.dialogue = "You've impressed me. That's all we have for now but \n allow me to accompany you through The Astral Plane."
			dialogue.open(self.get_path())
			get_parent().get_node("UI/CanvasLayer/Lives").show()
			
			#follow()
		else:
			dialogueTotal = 1
			dialogue.dialogue = "Take your time human, there's no such thing here."
			dialogue.open(self.get_path())

func bathroom():
	pass

func office():
	pass

func living_room():
	pass

func kitchen():
	pass

func hallway():
	pass
