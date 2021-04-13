extends Control

func _ready() -> void:
	Global.connect("puzzle_progress", self, "update_interface")
	update_interface()
	
func update_interface() -> void:
	#lives.text = "x %s" % Global.completed_puzzles
	if Global.completed_puzzles >= 1:
		$ProgressBar/Leela.visible = true
		#$EmptyProgressBar/Leela.visible = false
	if Global.completed_puzzles >= 2:
		$ProgressBar/Leela2.visible = true
		#$EmptyProgressBar/Leela2.visible = false
	if Global.completed_puzzles >= 3:
		$ProgressBar/Leela3.visible = true
		#$EmptyProgressBar/Leela3.visible = false
	if Global.completed_puzzles >= 4:
		$ProgressBar/Leela4.visible = true
		#$EmptyProgressBar/Leela4.visible = false
	if Global.completed_puzzles >= 5:
		$ProgressBar/Leela5.visible = true
		#$EmptyProgressBar/Leela5.visible = false
