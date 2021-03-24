extends Control

onready var scene_tree: = get_tree()
onready var lives: Label = get_node("CanvasLayer/Lives")

#lives are currently displayed by text, replace with cat pic

func _ready() -> void:
	Game.connect("lives_updated", self, "update_interface")
	update_interface()
	
func update_interface() -> void:
	lives.text = "Remaining Lives: %s" % Game.remaining_lives
