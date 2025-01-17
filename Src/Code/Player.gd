extends KinematicBody2D

#GLOBAL VARIABLES
export var ACCELERATION = 500
export var MAX_SPEED = 80
export var FRICTION = 500


#PERSONAL VARIABLES
var velocity = Vector2.ZERO
var can_interact: bool = false
var curr_target = null
#var stats = PlayerStats

#ONREADY VARIABLES (load when game starts)
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var dialogue = get_parent().get_node("UI/CanvasLayer/PopupDialog")

func _ready():
	pass
#	animationTree.active = true
	self.global_position = Global.player_initial_map_position

func _physics_process(delta):
		move_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationState.travel("Walk")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()
	
	if Input.is_action_just_pressed("interact"):
		if can_interact == true:
			dialogue.get_node("YouBox").visible = true
			dialogue.get_node("LeelaBox").visible = false
			curr_target.interaction()
	
func move():
	velocity = move_and_slide(velocity)


func _on_Detection(body: Node) -> void:
	#when something enters the player's detection, it becomes the new target for interaction
	#setup caveat for detecting self, which is apparently an issue
	if body == self:
		#print ("interacting with self, ignored")
		return
	if body.is_in_group("Walls"):
		return
	can_interact = true
	curr_target = body
	$iconset.visible = true
	print("can interact with " + curr_target.name)


func _off_Detection(body: Node) -> void:
	#when something exits the player's detection, if not the thing being targetted, player can't interact
	if curr_target == body:
		can_interact = false
		$iconset.visible = false
		print("lost interact with " + curr_target.name)
