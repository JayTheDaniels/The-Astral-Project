extends KinematicBody2D

var follow_player := false
var speed = 100
onready var dialogue = get_parent().get_node("UI/CanvasLayer/PopupDialog")
onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	if follow_player == true:
		var dir = (player.global_position - global_position).normalized()
		move_and_collide(dir * speed * delta)

func interaction():
	print("Is interacting with " + self.name)
	dialogue.dialogue = "Hiya friend, I'm Leela!"
	dialogue.open()
	#dialogue.dialogue = "Not common to see humans around here. I'm coming with you for a bit"
	get_parent().get_node("UI/CanvasLayer/Lives").show()
	follow()

func follow():
	follow_player = true
