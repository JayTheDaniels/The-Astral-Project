tool

extends Area2D

export(String, FILE) var next_scene_path = ""
export(Vector2) var player_spawn_location = Vector2.ZERO

func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "next_scene_path must be set for the door to work"
	else:
		return ""


func _on_Door_body_entered(body):
	Global.player_initial_map_position
	Global.player_initial_map_position = player_spawn_location
	if get_tree().change_scene(next_scene_path) != OK:
		#error handling
		print("Error: Unavailable scene!")
