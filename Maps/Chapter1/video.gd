extends Control

@export var nextmap: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_video_stream_player_finished() -> void:
	LoadManagement.load_scene(nextmap)


func _skipvideo():
	if Input.is_action_just_pressed("jump"):
		LoadManagement.load_scene(nextmap)
