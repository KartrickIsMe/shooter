extends CharacterBody2D

@export var speed := 1000

func _ready() -> void:
	print("PLAYER READY")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	velocity = direction.normalized() * speed
	move_and_slide()
