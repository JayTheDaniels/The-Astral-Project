extends StaticBody2D

#This script is the parent of all static game objects
#Other objects will inherit from this one
#Overwrite/overload the interaction() function for new objects

export(String, MULTILINE) var InteractText = ""
export(String, MULTILINE) var ScavengerHuntText = ""
onready var dialogue = get_parent().get_node("UI/CanvasLayer/PopupDialog")
var dialogueCounter = 0
var dialogueTotal = 0


func interaction():
	print("Is interacting with " + self.name)
	print (dialogueCounter)
	dialogue.dialogue = InteractText
	dialogue.open(self.get_path())
	if Global.scavengerHuntStage > 0:
		scavengerHunt()
	#get_parent().get_node("UI/CanvasLayer/Lives").show()

func scavengerHunt():
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
