extends "res://Src/Code/Object_Base.gd"

var astral_bedroom: String = "res://Src/Levels/AstralBedroom.tscn"
var normal_bedroom: String = "res://Src/Levels/Bedroom.tscn"
var astral_bathroom: String = "res://Src/Levels/AstralBathroom.tscn"
var normal_bathroom: String = "res://Src/Levels/Bathroom.tscn"
var astral_office: String = "res://Src/Levels/AstralOffice.tscn"
var normal_office: String = "res://Src/Levels/Office.tscn"
var astral_living_room: String = "res://Src/Levels/AstralLivingRoom.tscn"
var normal_living_room: String = "res://Src/Levels/LivingRoom.tscn"
var astral_kitchen: String = "res://Src/Levels/AstralKitchen.tscn"
var normal_kitchen: String = "res://Src/Levels/Kitchen.tscn"
var astral_hallway: String = "res://Src/Levels/AstralHallway.tscn"
var normal_hallway: String = "res://Src/Levels/Hallway.tscn"




func interaction():
	#maybe some cool fadeout thing here
	change_level()

func change_level() -> void:
	#probably the worst way to do it, but if it works it works

	var curr_level = get_tree().get_current_scene().get_name()

	if curr_level == "Bedroom":
		get_tree().change_scene(astral_bedroom)
	if curr_level == "AstralBedroom":
		get_tree().change_scene(normal_bedroom)
	if curr_level == "Bathroom":
		get_tree().change_scene(astral_bathroom)
	if curr_level == "AstralBathroom":
		get_tree().change_scene(normal_bathroom)
	if curr_level == "Office":
		get_tree().change_scene(astral_office)
	if curr_level == "AstralOffice":
		get_tree().change_scene(normal_office)
	if curr_level == "LivingRoom":
		get_tree().change_scene(astral_living_room)
	if curr_level == "AstralLivingRoom":
		get_tree().change_scene(normal_living_room)
	if curr_level == "Kitchen":
		get_tree().change_scene(astral_kitchen)
	if curr_level == "AstralKitchen":
		get_tree().change_scene(normal_kitchen)
	if curr_level == "Hallway":
		get_tree().change_scene(astral_hallway)
	if curr_level == "AstralHallway":
		get_tree().change_scene(normal_hallway)
