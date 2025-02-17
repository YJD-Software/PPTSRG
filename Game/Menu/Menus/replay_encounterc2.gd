extends Control

var level_path: String

func _open_replay() -> void:
	visible = true
	get_node("quit")._pressed()

func _load_replay(level_path: String):
	LoadManagement.load_scene(level_path)
