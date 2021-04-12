extends PopupDialog

var dialogue setget dialogue_set
var interactor
var open = false
var choice = false setget choice_set

func choice_set(switch):
	choice = switch

func dialogue_set(text):
	dialogue = text
	$VBoxContainer/Dialogue.text = text

func open(sender):
	interactor = get_tree().get_root().get_node(sender)
	open = true
	get_tree().paused = true
	popup()
	
func next():
	close()
	print(interactor.dialogueCounter)
	if interactor.dialogueCounter >= interactor.dialogueTotal:
		return
	else:
		interactor.dialogueCounter += 1
		interactor.interaction()
func close():
	get_tree().paused = false
	open = false
	hide()
	
func _input(event):
	if Input.is_action_just_pressed("accept"):
		if open == true :
			next()
		else:
			pass
	#if choice == true:
	#	if Input.is_action_just_pressed("choice X"):
	#		interactor.choice = "X"
	#		next()
	#	if Input.is_action_just_pressed("choice C"):
	#		interactor.choice = "C"
	#		next()

