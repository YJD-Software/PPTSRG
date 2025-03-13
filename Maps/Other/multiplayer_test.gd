extends Node3D

@onready var player_scene = preload("res://Player/player.tscn")

@export var player : PackedScene

func _ready():
	multiload.net_id = get_tree().get_multiplayer().get_peers()
	for id in multiload.players:
		add_player(id)


@rpc("any_peer")
func add_player(id):
	var player_instance = player.instantiate()
	player_instance.name = str(id)
	player_instance.initmulti(id)
	add_child(player_instance)


@rpc("any_peer")
func remove_player(id):
	if get_node(str(id)):
		get_node(str(id)).queue_free()
