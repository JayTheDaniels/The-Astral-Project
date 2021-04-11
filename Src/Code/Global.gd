extends Node

#top level code for tracking data across levels

signal puzzle_progress
signal scavengerHuntUpdated

var scavengerHuntLevel = 0 setget set_scavengerHuntLevel
var scavengerHuntStage = 0 setget set_scavengerHuntStage
var total_puzzles = 3
var completed_puzzles = 0 setget set_puzzles, get_puzzles
const portal = preload("res://Src/Code/Portal.gd")
var scavengerHunt = true

func set_puzzles(value: int) -> void:
	completed_puzzles = value
	emit_signal("puzzle_progress")

func get_puzzles() -> int:
	return completed_puzzles

var player_initial_map_position = Vector2(48, 144)

func set_scavengerHuntLevel(value: int) -> void:
	scavengerHuntLevel = value
	emit_signal("scavengerHuntUpdated")
	print ("Started Scavenger Hunt: ", scavengerHuntLevel)
	

func set_scavengerHuntStage(value: int) -> void:
	scavengerHuntStage = value
	emit_signal("scavengerHuntUpdated")
	#global function controlling the scavenger hunt
	#allows the scavenger text to appear
	print ("Set stage: ", scavengerHuntStage)
	if scavengerHuntLevel == 1:
		bedroom()
	if scavengerHuntLevel == 2:
		bathroom()
	if scavengerHuntLevel == 3:
		office()
	if scavengerHuntLevel == 4:
		living_room()
	if scavengerHuntLevel == 5:
		kitchen()
	if scavengerHuntLevel == 6:
		hallway()

func bedroom():
	if scavengerHuntStage == 1:
		var bookshelf = get_tree().get_root().get_node("/root/AstralBedroom/AstralBookshelf")
		bookshelf.InteractText = bookshelf.ScavengerHuntText
	if scavengerHuntStage == 2:
		var couch = get_tree().get_root().get_node("/root/AstralBedroom/AstralCouch")
		couch.InteractText = couch.ScavengerHuntText
	if scavengerHuntStage == 3:
		var bed = get_tree().get_root().get_node("/root/AstralBedroom/AstralBed")
		bed.InteractText = bed.ScavengerHuntText
	if scavengerHuntStage == 4:
		var tv = get_tree().get_root().get_node("/root/AstralBedroom/AstralTV")
		tv.InteractText = tv.ScavengerHuntText
	else:
		print("Scavenger error")

func bathroom():
	pass

func office():
	var todo = get_tree().get_root().get_node("/root/Office/TodoList")
	if scavengerHuntStage == 1:
		var plant = get_tree().get_root().get_node("/root/Office/HousePlant")
		plant.InteractText = plant.ScavengerHuntText
	if scavengerHuntStage == 2:
		var desk = get_tree().get_root().get_node("/root/Office/Desk")
		desk.InteractText = desk.ScavengerHuntText
	if scavengerHuntStage == 3:
		todo.InteractText = todo.ScavengerHuntText
	if scavengerHuntStage == 4:
		get_tree().get_root().get_node("/root/Office/Mirror").set_script(portal)
	if scavengerHuntStage == 5:
		var desk = get_tree().get_root().get_node("/root/AstralOffice/Desk")
		desk.InteractText = desk.ScavengerHuntText


func living_room():
	pass

func kitchen():
	if scavengerHuntStage == 1:
		var microwave = get_tree().get_root().get_node("/root/Kitchen/Microwave")
		microwave.InteractText = microwave.ScavengerHuntText
		var fridge = get_tree().get_root().get_node("/root/Kitchen/Fridge")
		fridge.InteractText = fridge.ScavengerHuntText
	if scavengerHuntStage == 2:
		var microwave = get_tree().get_root().get_node("/root/Kitchen/Microwave")
		microwave.InteractText = "Off you go! Just be prepared to come back \n to a very cold pizza."
		#insert timer here...
		get_tree().get_root().get_node("/root/Kitchen/Microwave").set_script(portal)
	if scavengerHuntStage == 3:
		var sink = get_tree().get_root().get_node("/root/AstralKitchen/Sink")
		sink.InteractText = sink.ScavengerHuntText
	if scavengerHuntStage == 4:
		var stove = get_tree().get_root().get_node("/root/AstralKitchen/Stove")
		stove.InteractText = stove.ScavengerHuntText
	if scavengerHuntStage == 5:
		var fridge = get_tree().get_root().get_node("/root/AstralKitchen/Fridge")
		fridge.InteractText = fridge.ScavengerHuntText
	if scavengerHuntStage == 6:
		var stove = get_tree().get_root().get_node("/root/AstralKitchen/Stove")
		stove.InteractText = "We have all the time in the world here. \n Let’s cook some of those thoughts!"
		#insert timer here


func hallway():
	pass
