extends KinematicBody2D

var follow_player := false
var speed = 100
var velocity = Vector2.ZERO
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
	dialogue.dialogue = "Hiya friend, I'm Leela!"
	dialogue.open()
	#dialogue.dialogue = "Not common to see humans around here. I'm coming with you for a bit"
	get_parent().get_node("UI/CanvasLayer/Lives").show()
	follow()

func follow():
	follow_player = true
