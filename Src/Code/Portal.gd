extends "res://Src/Code/Object_Base.gd"

var astral_scene: String = "res://Src/Levels/Astral_Level_Base.tscn"
var normal_scene: String = "res://Src/Levels/Level_Base.tscn"

#add the next scene level to the root node. Hide everything from this one
	#this keeps the previous level running in the background
	#for larger games this would kill memory
	#for this game, preloading every level for easier transitions is probably easiest

func interaction():
	change_level()

func change_level() -> void:
	if get_tree().get_root().get_node("/root/Level_Base"):
		get_tree().change_scene(astral_scene)
	elif get_tree().get_root().get_node("/root/Astral_Level_Base"):
		get_tree().change_scene(normal_scene)
