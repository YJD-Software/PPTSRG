extends StaticBody3D

@onready var camera = $base/hinge/Camera3D
@onready var hinge = $base/hinge
@onready var base = $base
@onready var hand_cast = $base/hinge/Camera3D/hand_cast
@onready var hand = $base/hinge/hand
@onready var set_position = $base/hinge/set_position
@onready var line = $base/hinge/line
@onready var line_position = $base/hinge/line_position
@onready var ui = $CanvasLayer/ui
@onready var use = $sfx/use
@onready var leave1 = $sfx/leave1
@onready var leave2 = $sfx/leave2
@onready var shoot = $sfx/shoot
@onready var retract = $sfx/retract

var sel = false
var using = false
var fired = false
@export var target_level: String
var hand_current = Vector3()
var hand_locked = true
var grab_point = Vector3()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if fired:
		hand_current = hand_current.move_toward(grab_point, 35 * delta)
		hand.global_position = hand_current
		line.position = line_position.position
		line.scale.z = line_position.global_position.distance_to(hand.global_position) / 2
		line.look_at(hand.global_position)
		line.visible = true
	else:
		hand_current = hand_current.move_toward(set_position.global_position, 35 * delta)
		hand.global_position = hand_current
		line.visible = false
	
	if hand_current == set_position.global_position:
		hand_locked = true
	else:
		hand_locked = false

func _fire_hand():
	grab_point = hand_cast.get_collision_point()
	shoot.play()
	fired = true

func _release_hand():
	retract.play()
	fired = false

func _on_det_area_entered(area):
	sel = true

func _on_det_area_exited(area):
	sel = false

func _on_lever_pulled(direction):
	if not fired:
		_fire_hand()
		LoadManagement.load_scene(target_level)
	else:
		_release_hand()
