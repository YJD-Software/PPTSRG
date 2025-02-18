extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_video_stream_player_finished() -> void:
	play()
	await get_tree().create_timer(11).timeout
	LoadManagement.load_scene("res://Game/Menu/Menus/main_title.tscn")
