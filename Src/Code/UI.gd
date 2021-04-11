extends Control

onready var scene_tree: = get_tree()
onready var lives: Label = get_node("CanvasLayer/Lives")

#lives are currently displayed by text, replace with cat pic

func _ready() -> void:
	Global.connect("puzzle_progress", self, "update_interface")
	update_interface()
	
func update_interface() -> void:
	lives.text = "Puzzles Complete: %s" % Global.completed_puzzles
