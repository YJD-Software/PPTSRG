extends Control

const PORT = 443
const MAX_PLAYERS = 10

var peer = null

@onready var player_scene = preload("res://Player/player.tscn")

func _on_player_connected(id):
	print("Player connected with ID:", id)
	multiload.players.append(id)

func _on_replay_pressed() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_PLAYERS)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_player_connected)  # Connect the signal
	print("Server started on port", PORT)

func _on_settings_pressed() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client("127.0.0.1", PORT)
	multiplayer.multiplayer_peer = peer
	print("Connected to server")
	rpc("_change_scene", "res://Game.tscn")


func _on_settings_2_pressed() -> void:
	if multiplayer.is_server():
		rpc("_change_scene", "res://Game.tscn")
		
@rpc("call_local")
func _change_scene(scene_path):
	LoadManagement.load_scene("res://Maps/Other/MultiplayerTest.tscn")
