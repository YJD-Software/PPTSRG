extends Control

var godot_hwnd: int = 0

func _ready() -> void:
	var dll = load("res://EmbedGodot.dll")
	if dll:
		godot_hwnd = dll.call_function("GetGodotWindowHandle")
		print("Godot Window Handle:", godot_hwnd)
	else:
		print("Failed to load DLL")
	var multi = OS.get_executable_path()
	Window.FLAG_BORDERLESS
	get_window().size = Vector2(0, 0)
	OS.execute(multi+"ppsgm.exe", ["--window-handle=", godot_hwnd])
	LoadManagement.load_scene("res://Game/Menu/Menus/Main_Title.tscn")
	get_window().size = Vector2(1152, 648)
