extends Button

export(String, MULTILINE) var credits = ""


func _on_Credits_pressed():
	var text = get_parent().get_parent().get_node("Text")
	text.text = credits
