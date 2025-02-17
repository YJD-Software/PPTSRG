extends Button

@export var level_path: String

func _ready():
	pressed.connect(Callable(self,"_pressed"))

func _pressed() -> void:
	var parent = get_parent()
	parent._load_replay(level_path)
