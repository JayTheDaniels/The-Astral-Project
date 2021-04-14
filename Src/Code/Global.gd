extends Node

#top level code for tracking data across levels

signal puzzle_progress
signal scavengerHuntUpdated

var player_initial_map_position = Vector2(48, 144)
var scavengerHuntLevel = 0 setget set_scavengerHuntLevel
var scavengerHuntStage = 0 setget set_scavengerHuntStage
var completed_puzzles = 0 setget set_puzzles
const portal = preload("res://Src/Code/Portal.gd")
var outro: PackedScene = preload("res://Src/Levels/Outro.tscn")

var scavengerHunt = false

func set_puzzles(value: int) -> void:
	completed_puzzles = value
	print ("Puzzles Completed: ", completed_puzzles)
	emit_signal("puzzle_progress")



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
		var mirror = get_tree().get_root().get_node("/root/AstralBedroom/AstralMirror")
		mirror.InteractText = mirror.ScavengerHuntText
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
	if scavengerHuntStage == 1:
		var bathtub = get_tree().get_root().get_node("/root/Bathroom/Bathtub")
		bathtub.InteractText = bathtub.ScavengerHuntText
	if scavengerHuntStage == 2:
		var towels = get_tree().get_root().get_node("/root/Bathroom/Towels")
		towels.InteractText = towels.ScavengerHuntText
	if scavengerHuntStage == 3:
		get_tree().get_root().get_node("/root/Bathroom/Bathtub").set_script(portal)
	if scavengerHuntStage == 4:
		var toilet = get_tree().get_root().get_node("/root/AstralBathroom/Toilet")
		toilet.InteractText = toilet.ScavengerHuntText
	if scavengerHuntStage == 5:
		var toiletpaper = get_tree().get_root().get_node("/root/AstralBathroom/ToiletPaper")
		toiletpaper.InteractText = toiletpaper.ScavengerHuntText
	if scavengerHuntStage == 6:
		var toilet = get_tree().get_root().get_node("/root/AstralBathroom/Toilet")
		toilet.InteractText = "You flush away all of your problems. You feel like a great weight has been lifted. You should wash your hands."
	if scavengerHuntStage == 7:
		var sink = get_tree().get_root().get_node("/root/AstralBathroom/Sink")
		sink.InteractText = sink.ScavengerHuntText

func office():
	if scavengerHuntStage == 1:
		var plant = get_tree().get_root().get_node("/root/Office/HousePlant")
		plant.InteractText = plant.ScavengerHuntText
	if scavengerHuntStage == 2:
		var desk = get_tree().get_root().get_node("/root/Office/Desk")
		desk.InteractText = desk.ScavengerHuntText
	if scavengerHuntStage == 3:
		var todo = get_tree().get_root().get_node("/root/Office/TodoList")
		todo.InteractText = todo.ScavengerHuntText
	if scavengerHuntStage == 4:
		get_tree().get_root().get_node("/root/Office/Mirror").set_script(portal)
	if scavengerHuntStage == 5:
		var desk = get_tree().get_root().get_node("/root/AstralOffice/Desk")
		desk.InteractText = desk.ScavengerHuntText


func living_room():
	if scavengerHuntStage == 1:
		var stool = get_tree().get_root().get_node("/root/LivingRoom/Stool")
		stool.InteractText = stool.ScavengerHuntText
	if scavengerHuntStage == 2:
		var fireplace = get_tree().get_root().get_node("/root/LivingRoom/Fireplace")
		fireplace.InteractText = fireplace.ScavengerHuntText
		get_tree().get_root().get_node("/root/LivingRoom/Fireplace").set_script(portal)
	if scavengerHuntStage == 3:
		var chair = get_tree().get_root().get_node("/root/AstralLivingRoom/Chair")
		chair.InteractText = chair.ScavengerHuntText
	if scavengerHuntStage == 4:
		var stool2 = get_tree().get_root().get_node("/root/AstralLivingRoom/Stool2")
		stool2.InteractText = stool2.ScavengerHuntText
	if scavengerHuntStage == 5:
		var chair2 = get_tree().get_root().get_node("/root/AstralLivingRoom/Chair2")
		chair2.InteractText = chair2.ScavengerHuntText


func kitchen():
	if scavengerHuntStage == 1:
		var microwave = get_tree().get_root().get_node("/root/Kitchen/Microwave")
		microwave.InteractText = microwave.ScavengerHuntText
		var fridge = get_tree().get_root().get_node("/root/Kitchen/Fridge")
		fridge.InteractText = fridge.ScavengerHuntText
	if scavengerHuntStage == 2:
		var microwave = get_tree().get_root().get_node("/root/Kitchen/Microwave")
		microwave.InteractText = "Off you go! Just be prepared to come back to a very cold pizza."
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
		stove.InteractText = "We have all the time in the world here. Let’s cook some of those thoughts!"
		#insert timer here


func hallway():
	if scavengerHuntStage == 1:
		get_tree().get_root().get_node("/root/Hallway/Painting").set_script(portal)
	if scavengerHuntStage == 2:
		get_tree().change_scene_to(outro)
