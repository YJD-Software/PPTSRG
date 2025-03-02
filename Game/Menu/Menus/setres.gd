extends Button

@export var Horiz: int
@export var Verti: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	get_window().size = Vector2(Horiz, Verti)
	ProjectSettings.set("display/window/size/viewport_width", Horiz)
	ProjectSettings.set("display/window/size/viewport_height", Verti)
