extends Button

@export var game: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(Callable(self,"_pressed"))

func _pressed() -> void:
	LoadManagement.load_scene(game)
