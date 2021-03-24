extends Node

#top level code for tracking data across levels

signal lives_updated

var total_lives = 9
var remaining_lives = 9 setget set_lives, get_lives

func set_lives(value: int) -> void:
	remaining_lives = value
	emit_signal("lives_updated")

func get_lives() -> int:
	return remaining_lives
