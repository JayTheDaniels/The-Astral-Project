extends Button

var portal_scene := load("res://Src/Game Objects/Portal.tscn")

var portal_active:= false

func _on_Button_pressed() -> void:
	spawn_portal()

func spawn_portal():
	#only spawn portal if there isn't already one in the scene
	if portal_active == false:
		var portal = portal_scene.instance()
		if get_tree().get_root().get_node("/root/Level_Base"):
			portal.global_position = get_tree().get_root().get_node("/root/Level_Base/Player").global_position
			get_node("/root/Level_Base").add_child(portal)
		elif get_tree().get_root().get_node("/root/Astral_Level_Base"):
			portal.global_position = get_tree().get_root().get_node("/root/Astral_Level_Base/Player").global_position
			get_node("/root/Astral_Level_Base").add_child(portal)
		portal_active = true
	else: 
		return
