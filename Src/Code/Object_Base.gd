extends StaticBody2D

#This script is the parent of all static game objects
#Other objects will inherit from this one
#Overwrite/overload the interaction() function for new objects

export var InteractText = '' 
onready var dialogue = get_parent().get_parent().get_node("UI/CanvasLayer/PopupDialog")


func interaction():
	print("Is interacting with " + self.name)
	dialogue.dialogue = InteractText
	dialogue.open()
	#get_parent().get_node("UI/CanvasLayer/Lives").show()
