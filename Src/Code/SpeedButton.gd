extends Button



func _on_SpeedButton_pressed() -> void:
	super_speed()

func super_speed():
	#sets speed to super fast just to make the difference clear
	if get_tree().get_root().get_node("/root/Level_Base"):
		var player = get_tree().get_root().get_node("Level_Base/Player")
		player.MAX_SPEED = 160
	elif get_tree().get_root().get_node("/root/Astral_Level_Base"):
		var player = get_tree().get_root().get_node("Astral_Level_Base/Player")
		player.MAX_SPEED = 160
