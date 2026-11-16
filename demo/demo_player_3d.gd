extends CharacterBody3D

# Demo-only stand-in player so this pack stays standalone. The Controller pack
# (or your own player) replaces this: brains just need something in the
# "player" group.

@export var speed: float = 5.0               ## m/s


func _ready() -> void:
	add_to_group("player")


func _physics_process(delta: float) -> void:
	var dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity.x = dir.x * speed
	velocity.z = dir.y * speed
	if not is_on_floor():
		velocity.y -= float(ProjectSettings.get_setting("physics/3d/default_gravity", 9.8)) * delta
	if dir.length_squared() > 0.01:
		rotation.y = lerp_angle(rotation.y, atan2(-dir.x, -dir.y), 12.0 * delta)
	move_and_slide()
