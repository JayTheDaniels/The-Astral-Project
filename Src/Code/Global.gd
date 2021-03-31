extends Node

#top level code for tracking data across levels

signal lives_updated
signal scavengerHuntUpdated

var scavengerHuntStage = 0 setget set_scavengerHuntStage
var total_lives = 9
var remaining_lives = 9 setget set_lives, get_lives

func set_lives(value: int) -> void:
	remaining_lives = value
	emit_signal("lives_updated")

func get_lives() -> int:
	return remaining_lives

var player_initial_map_position = Vector2(48, 144)

func set_scavengerHuntStage(value: int) -> void:
	scavengerHuntStage = value
	emit_signal("scavengerHuntUpdated")
	#global function controlling the scavenger hunt
	#allows the scavenger text to appear
	print ("Set stage: ", scavengerHuntStage)
	if scavengerHuntStage == 1:
		var bookshelf = get_tree().get_root().get_node("/root/Astral_Level_Base/AstralBookshelf")
		bookshelf.InteractText = bookshelf.ScavengerHuntText
	if scavengerHuntStage == 2:
		var couch = get_tree().get_root().get_node("/root/Astral_Level_Base/AstralCouch")
		couch.InteractText = couch.ScavengerHuntText
	if scavengerHuntStage == 3:
		var bed = get_tree().get_root().get_node("/root/Astral_Level_Base/AstralBed")
		bed.InteractText = bed.ScavengerHuntText
	if scavengerHuntStage == 4:
		var tv = get_tree().get_root().get_node("/root/Astral_Level_Base/AstralTV")
		tv.InteractText = tv.ScavengerHuntText
	else:
		print("Scavenger error")
		
