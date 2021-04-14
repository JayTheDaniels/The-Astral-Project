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
const portal = preload("res://Src/Code/Portal.gd")

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
	switchBox()
	dialogue()


func follow():
	follow_player = true
	
func switchBox():
	dialogue.get_node("YouBox").visible = false
	dialogue.get_node("LeelaBox").visible = true

func dialogue():
	if interaction_room == 1:
		bedroom()
	if interaction_room == 2:
		bathroom()
	if interaction_room == 3:
		office()
	if interaction_room == 4:
		living_room()
	if interaction_room == 5:
		kitchen()
	if interaction_room == 6:
		hallway()
		

func bedroom():
	var interaction_Counter = 0
	dialogueTotal = 4
	if dialogueCounter == 0:
		dialogue.dialogue = "A visitor..? From the mortal plane no less!"
		dialogue.open(self.get_path())
		$Meow.play()
	if dialogueCounter == 1:
		dialogue.dialogue = "Not common to see humans around here. Are you lost?"
		dialogue.open(self.get_path())
	if dialogueCounter == 2:
		dialogue.dialogue = "Don't worry human. I can show you how to navigate The Astral Plane."
		dialogue.open(self.get_path())
	if dialogueCounter == 3:
		dialogue.dialogue = "Let's make a game of it! Look inside your vase. Your first clue waits for you there."
		dialogue.open(self.get_path())
		Global.scavengerHunt = true
		Global.scavengerHuntLevel = 1
		Global.scavengerHuntStage = 1
	if dialogueCounter == 4:
		dialogue.dialogue = "Take your time human, there's no such thing here."
		interaction_Counter = 1
	if interaction_Counter == 1:
		if Global.scavengerHuntStage == 5:
			dialogue.dialogue = "You've impressed me, human. There are more secrets to be found in your other rooms. Return to your bed when you're ready to leave."
			dialogue.open(self.get_path())
			#get_parent().get_node("UI/CanvasLayer/Lives").show()
			# use this code for setting the return object
			Global.completed_puzzles = Global.completed_puzzles + 1
			get_tree().get_root().get_node("/root/AstralBedroom/AstralBed").set_script(portal)
			Global.scavengerHuntStage = 6
		else:
			dialogueTotal = 1
			dialogue.dialogue = "Take your time human, there's no such thing here."
			dialogue.open(self.get_path())

func bathroom():
	var interaction_Counter = 0
	dialogueTotal = 4
	if dialogueCounter == 0:
		dialogue.dialogue = "Scrubba dub dub. Astral Cat in your tub. Welcome back human, thanks for the warm bath."
		dialogue.open(self.get_path())
		$Meow.play()
	if dialogueCounter == 1:
		dialogue.dialogue = "For this puzzle, let's cleanse you of your negative thoughts. Good thing we're in a bathroom."
		dialogue.open(self.get_path())
	if dialogueCounter == 2:
		dialogue.dialogue = "Just do what you would normally do, the Astral World will handle the rest."
		dialogue.open(self.get_path())
		Global.scavengerHuntStage = 4
	if dialogueCounter == 3:
		dialogue.dialogue = "Take your time human, there's no such thing here."
		dialogue.open(self.get_path())
		interaction_Counter = 1
	if interaction_Counter == 1:
		if Global.scavengerHuntStage == 8:
			dialogue.dialogue = "You continue to impress, human. When you're ready to leave, flush yourself out of this world."
			dialogue.open(self.get_path())
			$Meow.play()
			#get_parent().get_node("UI/CanvasLayer/Lives").show()
			# use this code for setting the return object
			Global.completed_puzzles = Global.completed_puzzles + 1
			get_tree().get_root().get_node("/root/AstralBathroom/Toilet").set_script(portal)
			Global.scavengerHuntStage = 9
		else:
			dialogueTotal = 1
			$Meow.play()
			dialogue.dialogue = "Take your time human, there's no such thing here."
			dialogue.open(self.get_path())

func office():
	var interaction_Counter = 0
	dialogueTotal = 2
	if dialogueCounter == 0:
		dialogue.dialogue = "Friend! Hello again... I have a new gift for you. A new puzzle to go with it."
		dialogue.open(self.get_path())
		$Meow.play()
		Global.scavengerHuntStage = 5
	if dialogueCounter == 1:
		dialogue.dialogue = "Communicate with family, research, shop, and play games."
		dialogue.open(self.get_path())
	if dialogueCounter == 2:
		dialogue.dialogue = "Since this invention swept your world, Human life has greatly changed."
		dialogue.open(self.get_path())
		interaction_Counter = 1
	if interaction_Counter == 1:
		if Global.scavengerHuntStage == 6:
			dialogue.dialogue = "You're getting better at this human. The mirror will take you home now."
			Global.completed_puzzles = Global.completed_puzzles + 1
			get_tree().get_root().get_node("/root/AstralOffice/Mirror").set_script(portal)
			Global.scavengerHuntStage = 7
		else:
			dialogueTotal = 1
			if dialogueCounter == 1:
				dialogue.dialogue = "Communicate with family, research, shop, and play games."
				dialogue.open(self.get_path())
			if dialogueCounter == 2:
				dialogue.dialogue = "Since this invention swept your world, Human life has greatly changed."
				dialogue.open(self.get_path())



func living_room():
	var interaction_Counter = 0
	dialogueTotal = 2
	if dialogueCounter == 0:
		dialogue.dialogue = "Welcome back to the Astral World! Not so lonely here."
		dialogue.open(self.get_path())
		Global.scavengerHuntStage = 3
		$Meow.play()
	if dialogueCounter == 1:
		dialogue.dialogue = "Let's warm those empty seats with a game of musical chairs."
		dialogue.open(self.get_path())
	if dialogueCounter == 2:
		dialogue.dialogue = "Take it from the top and dance around the clock."
		dialogue.open(self.get_path())
		interaction_Counter = 1
	if interaction_Counter == 1:
		if Global.scavengerHuntStage == 6:
			$Meow.play()
			dialogue.dialogue = "Well done! If you're burning to return home the flames will take you there."
			Global.completed_puzzles = Global.completed_puzzles + 1
			get_tree().get_root().get_node("/root/AstralLivingRoom/Fireplace").set_script(portal)
			Global.scavengerHuntStage = 7
		else:
			dialogue.dialogue = "My favourite games are played at the dining table. It's as easy as 1,2,3..."
			dialogue.open(self.get_path())

func kitchen():
	var interaction_Counter = 0
	dialogueTotal = 1
	if dialogueCounter == 0:
		$Meow.play()
		dialogue.dialogue = "You made it! Some sassy comebacks from the kitchen. Although, it is YOUR kitchen…"
		dialogue.open(self.get_path())
		Global.scavengerHuntStage = 3
		interaction_Counter = 1
	if dialogueCounter == 1:
		dialogue.dialogue = "What kind of thoughts have you been cooking up??"
		dialogue.open(self.get_path())
	if Global.scavengerHuntStage == 7:
		dialogue.dialogue = "You don’t have to be so hard on yourself you know. You did well. Fire up those radiations and let’s head back!"
		dialogue.open(self.get_path())
		Global.completed_puzzles = Global.completed_puzzles + 1
		Global.scavengerHuntStage = 8
		get_tree().get_root().get_node("/root/AstralKitchen/Microwave").set_script(portal)

		
func hallway():
	pass
