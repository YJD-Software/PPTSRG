extends Button

const EXECUTABLE_NAMES = {
	"Windows": "Game.exe",
	"Windows32": "Game32.exe",
	"WindowsARM": "GameARM.exe",
	"Linux": "Game.x86_64",
	"Linux32": "Game.x86",
	"LinuxARM": "Game.arm64",
	"LinuxARM32": "Game.arm"
}

const RENDERING_OPTIONS = {
	"Vulkan": "--rendering-driver vulkan",
	"OpenGL4": "--rendering-driver opengl4",
	"DX11": "--rendering-driver dx11",
	"DX12": "--rendering-driver dx12"
}

func _on_switch_button_pressed():
	var selected_renderer = "Vulkan"  # Change this based on your UI selection logic
	save_and_restart(selected_renderer)

func save_and_restart(selected_renderer: String):
	var config = ConfigFile()
	config.set_value("video", "renderer", selected_renderer)
	config.save("user://settings.cfg")

	var current_executable = OS.get_executable_path()
	var exec_name = current_executable.get_file()

	for platform in EXECUTABLE_NAMES:
		if exec_name == EXECUTABLE_NAMES[platform]:
			OS.create_process(current_executable, [RENDERING_OPTIONS[selected_renderer]])
			get_tree().quit()
			return

	print("Error: Could not determine correct executable for restart.")
