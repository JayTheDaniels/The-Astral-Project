extends Control

onready var scene_tree: = get_tree()
onready var lives: Label = get_node("CanvasLayer/Lives")

#lives are currently displayed by text, replace with cat pic

func _ready() -> void:
	Global.connect("puzzle_progress", self, "update_interface")
	update_interface()
	
func update_interface() -> void:
	#lives.text = "x %s" % Global.completed_puzzles
	if Global.completed_puzzles == 1:
		$HBoxContainer/Leela.visible = true
	if Global.completed_puzzles == 2:
		$HBoxContainer/Leela2.visible = true
	if Global.completed_puzzles == 3:
		$HBoxContainer/Leela3.visible = true
	if Global.completed_puzzles == 4:
		$HBoxContainer/Leela4.visible = true
	if Global.completed_puzzles == 5:
		$HBoxContainer/Leela5.visible = true
