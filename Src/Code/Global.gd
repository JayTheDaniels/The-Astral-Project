extends Node

#top level code for tracking data across levels

signal lives_updated
signal scavengerHuntUpdated

var scavengerHuntLevel = 0 setget set_scavengerHuntLevel
var scavengerHuntStage = 0 setget set_scavengerHuntStage
var total_lives = 9
var remaining_lives = 9 setget set_lives, get_lives
const portal = preload("res://Src/Code/Portal.gd")

func set_lives(value: int) -> void:
	remaining_lives = value
	emit_signal("lives_updated")

func get_lives() -> int:
	return remaining_lives

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
		var bookshelf = get_tree().get_root().get_node("/root/Level_Base/AstralBookshelf")
		bookshelf.InteractText = bookshelf.ScavengerHuntText
	if scavengerHuntStage == 2:
		var couch = get_tree().get_root().get_node("/root/Level_Base/AstralCouch")
		couch.InteractText = couch.ScavengerHuntText
	if scavengerHuntStage == 3:
		var bed = get_tree().get_root().get_node("/root/Level_Base/AstralBed")
		bed.InteractText = bed.ScavengerHuntText
	if scavengerHuntStage == 4:
		var tv = get_tree().get_root().get_node("/root/Level_Base/AstralTV")
		tv.InteractText = tv.ScavengerHuntText
	else:
		print("Scavenger error")

func bathroom():
	pass

func office():
	var todo = get_tree().get_root().get_node("/root/Level_Base/TodoList")
	if scavengerHuntStage == 2:
		var plant = get_tree().get_root().get_node("/root/Level_Base/HousePlant")
		plant.InteractText = plant.ScavengerHuntText
	if scavengerHuntStage == 3:
		var desk = get_tree().get_root().get_node("/root/Level_Base/Desk")
		desk.InteractText = desk.ScavengerHuntText		
	if scavengerHuntStage == 4:
		#var tv = get_tree().get_root().get_node("/root/Level_Base/AstralTV")
		#create a new script for todo list that inherets from base object
		todo.InteractText = todo.ScavengerHuntText
	if scavengerHuntStage == 5:
		get_tree().get_root().get_node("/root/Level_Base/Mirror").set_script(portal)

func living_room():
	pass

func kitchen():
	pass

func hallway():
	pass
