extends StaticBody2D

#This script is the parent of all static game objects
#Other objects will inherit from this one
#Overwrite/overload the interaction() function for new objects

func interaction():
	print("Is interacting with " + self.name)
	
