extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.tooltip("W, A, S, D to Move, Mouse to Look", 5)
	await get_tree().create_timer(5).timeout
	Game.tooltip("Left and Right Click for Respective Hands", 5)
	await get_tree().create_timer(5).timeout
	Game.tooltip("E to Use, Space bar to Jump, Shift to Sprint and Ctrl to Crouch", 5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
