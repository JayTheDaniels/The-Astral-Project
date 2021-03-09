extends Button



func _on_InvisibleButton_pressed() -> void:
	invisible()
	

func invisible():
	#super simple change transparency script
	if get_tree().get_root().get_node("/root/Level_Base"):
		var player = get_tree().get_root().get_node("Level_Base/Player")
		player.get_node("Sprite").modulate.a = 0.5
	elif get_tree().get_root().get_node("/root/Astral_Level_Base"):
		var player = get_tree().get_root().get_node("Astral_Level_Base/Player")
		player.get_node("Sprite").modulate.a = 0.5
