extends Node2D

# Lite demo: arrows move the square; get close and the red brains chase, run
# far and they leash home. The status line narrates off the bus.

@onready var _status: Label = %Status


func _ready() -> void:
	_enemy_ai_lite().state_changed.connect(func(enemy: Node, from: StringName, to: StringName) -> void:
		_status.text = "%s: %s -> %s" % [enemy.name, from, to])
	_enemy_ai_lite().attack_started.connect(func(enemy: Node, _t: Node) -> void:
		_status.text = "%s attacks!" % enemy.name)


# EnemyAILite is looked up when used instead of named. A script that names an autoload
# won't compile until the plugin that adds it is switched on, so a fresh install
# printed parse errors.
const ENEMY_AI_LITE := preload("res://addons/enemy_ai_lite/enemy_ai_bus_lite.gd")


static func _enemy_ai_lite() -> ENEMY_AI_LITE:
	return (Engine.get_main_loop() as SceneTree).root.get_node(^"EnemyAILite") as ENEMY_AI_LITE
