extends PopupDialog

var dialogue setget dialogue_set


func dialogue_set(text):
	dialogue = text
	$VBoxContainer/Dialogue.text = text

func open():
	get_tree().paused = true
	popup()
	
func close():
	get_tree().paused = false
	hide()
	
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			close()
		
