extends CharacterBody2D

@export var health: int = 3
@export var speed: float = 800.0
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var aSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var navAgent: NavigationAgent2D = $NavigationAgent2D


func _ready() -> void:
	aSprite.play("default")

func _physics_process(delta: float) -> void:
	if player.global_position.x > global_position.x:
		aSprite.flip_h = true
	else:
		aSprite.flip_h = false
	navAgent.target_position = player.global_position
	var direction = (player.global_position - global_position).normalized()
	velocity = speed * direction
	move_and_slide()

func hurt() -> void:
	health -= 1
	if health <= 0:
		queue_free()
