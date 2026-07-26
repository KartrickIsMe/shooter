extends CharacterBody2D

@export var speed := 1000
const bullet_scene = preload("res://ScenesAndScripts/Bullet.tscn")

func _ready() -> void:
	print("PLAYER READY")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		print("SHOT")
		shoot()

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	velocity = direction.normalized() * speed
	move_and_slide()

func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	get_tree().current_scene.add_child(bullet)
