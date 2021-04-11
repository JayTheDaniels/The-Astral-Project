extends "res://Src/Code/Object_Base.gd"
const portal = preload("res://Src/Code/Portal.gd")

func interaction():
	print("Is interacting with " + self.name)
	print ("Dialogue Count: ", dialogueCounter)
	dialogue.dialogue = InteractText
	dialogue.open(self.get_path())
	boredom()
	if dialogueCounter >= 4:
		interaction_Counter += 1


func boredom():
	dialogueTotal = 4
	if dialogueCounter == 0:
		dialogue.dialogue = "Nothing else to do, might as well flip through channels..."
		dialogue.open(self.get_path())
	if dialogueCounter == 1:
		dialogue.dialogue = "Seen it."
		dialogue.open(self.get_path())
	if dialogueCounter == 2:
		dialogue.dialogue = "Not interesting."
		dialogue.open(self.get_path())
	if dialogueCounter == 3:
		dialogue.dialogue = "News? Too depressing."
		dialogue.open(self.get_path())
	if dialogueCounter == 4:
		dialogue.dialogue = "No point. I should just lay in bed..."
		dialogue.open(self.get_path())
		get_tree().get_root().get_node("/root/Bedroom/Bed").set_script(portal)
		print("Portal opened")
	if interaction_Counter >= 1:
		dialogueTotal = 1
		dialogue.dialogue = "Still nothing good on, might as well just sleep."
		dialogue.open(self.get_path())
