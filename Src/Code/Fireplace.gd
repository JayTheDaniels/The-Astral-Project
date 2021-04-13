extends "res://Src/Code/Object_Base.gd"


func interaction():
	print("Is interacting with " + self.name)
	print ("Dialogue Count: ", dialogueCounter)
	dialogue.dialogue = InteractText
	dialogue.open(self.get_path())
	if Global.scavengerHuntLevel != 4:
		Global.scavengerHuntLevel = 4
		Global.scavengerHuntStage = 1
		scavengerHunt()
	if Global.scavengerHuntLevel == 4:
		scavengerHunt()
