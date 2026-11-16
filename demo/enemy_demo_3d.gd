extends Node3D

# Lite 3D demo: arrows move the capsule; get close and the red brains chase, run
# far and they leash home. The status line narrates off the bus.

const CAMERA_OFFSET := Vector3(0.0, 10.0, 7.0)

@onready var _status: Label = %Status
@onready var _player: Node3D = %Player
@onready var _camera: Camera3D = %Camera


func _ready() -> void:
	_enemy_ai_lite().state_changed.connect(func(enemy: Node, from: StringName, to: StringName) -> void:
		_status.text = "%s: %s -> %s" % [enemy.name, from, to])
	_enemy_ai_lite().attack_started.connect(func(enemy: Node, _t: Node) -> void:
		_status.text = "%s attacks!" % enemy.name)


# The camera rides along at a fixed angle so the player stays in view.
func _process(_delta: float) -> void:
	_camera.global_position = _player.global_position + CAMERA_OFFSET
	_camera.look_at(_player.global_position)


# EnemyAILite is looked up when used instead of named. A script that names an autoload
# won't compile until the plugin that adds it is switched on, so a fresh install
# printed parse errors.
const ENEMY_AI_LITE := preload("res://addons/enemy_ai_lite/enemy_ai_bus_lite.gd")


static func _enemy_ai_lite() -> ENEMY_AI_LITE:
	return (Engine.get_main_loop() as SceneTree).root.get_node(^"EnemyAILite") as ENEMY_AI_LITE
