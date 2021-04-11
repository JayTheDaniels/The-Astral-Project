extends StaticBody2D

#This script is the parent of all static game objects
#Other objects will inherit from this one
#Overwrite/overload the interaction() function for new objects

# consider adding an Astral Object class that inherits from this one


#const portal = preload("res://Src/Code/Portal.gd")
export(String, MULTILINE) var InteractText = ""
export(String, MULTILINE) var ScavengerHuntText = ""
export var startpoint = false
onready var dialogue = get_parent().get_node("UI/CanvasLayer/PopupDialog")
var dialogueCounter = 0
var dialogueTotal = 0


func interaction():
	print("Is interacting with " + self.name)
	print ("Dialogue Count: ", dialogueCounter)
	dialogue.dialogue = InteractText
	dialogue.open(self.get_path())
	if startpoint == true:
		get_start()
	else:
		scavengerHunt()
	#get_parent().get_node("UI/CanvasLayer/Lives").show()

func get_start():
	if self.name == "Microwave":
		Global.scavengerHuntLevel = 5
		Global.scavengerHuntStage = 1

func scavengerHunt():
	if Global.scavengerHuntLevel == 1:
		bedroom_object()
	if Global.scavengerHuntLevel == 2:
		bathroom_object()
	if Global.scavengerHuntLevel == 3:
		office_object()
	if Global.scavengerHuntLevel == 4:
		living_room_object()
	if Global.scavengerHuntLevel == 5:
		kitchen_object()
	if Global.scavengerHuntLevel == 6:
		hallway_object()

func bedroom_object():
	if Global.scavengerHuntStage == 1:
		if self.name == "AstralBookshelf":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 2
	if Global.scavengerHuntStage == 2:
		if self.name == "AstralCouch":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 3
	if Global.scavengerHuntStage == 3:
		if self.name == "AstralBed":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 4
	if Global.scavengerHuntStage == 4:
		if self.name == "AstralTV":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 5

func bathroom_object():
	pass

func office_object():
	if Global.scavengerHuntStage == 1:
		if self.name == "TodoList":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 2
	if Global.scavengerHuntStage == 2:
		if self.name == "HousePlant":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 3
	if Global.scavengerHuntStage == 3:
		if self.name == "Desk":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 4
	if Global.scavengerHuntStage == 4:
		if self.name == "TodoList":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 5
	if Global.scavengerHuntStage == 6:
		if self.name == "Desk":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 7

func living_room_object():
	pass

func kitchen_object():
	if Global.scavengerHuntStage == 1:
		if self.name == "Fridge":
			print ("Objective Updated!")
			Global.scavengerHuntStage = 2
	if Global.scavengerHuntStage == 3:
		if self.name == "Sink":
			print ("Ojbective Updated!")
			Global.scavengerHuntStage = 4
	if Global.scavengerHuntStage == 4:
		if self.name == "Stove":
			print("Objective Updated!")
			Global.scavengerHuntStage = 5
	if Global.scavengerHuntStage == 5:
		if self.name == "Fridge":
			print("Objective Updated!")
			Global.scavengerHuntStage = 6
	if Global.scavengerHuntStage == 6:
		if self.name == "Stove":
			print("Objective Updated!")
			Global.scavengerHuntStage = 7




func hallway_object():
	pass
